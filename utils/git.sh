#!/usr/bin/env /bin/bash

GIT_ERR_STR=(
  "invalid arguments" # 1
  "undefined error" # 2
  ""
  ""
  ""
  ""
  ""
  ""
  ""
  "git_can_pull: not a git repository" # 10
  "git_can_pull: different repository" # 11
  "git_can_pull: different branch" # 12
  "git_can_clone: not empty directory" # 13
  "git_can_clone: not empty target" # 14
  "git_pull: already up to date" # 15
)

git_can_pull() {
  target=$1
  url=$2
  branch=$3

  if [ ! -f "$target/.git/config" ]; then
    return 10
  fi

  # TODO: git, http
  target_origin=$(git -C $target remote get-url origin)
  if [ "$target_origin" != "$url" ]; then
    return 11
  fi

  target_branch=$(
    git -C $target symbolic-ref -q --short HEAD 2>/dev/null ||
    git -C $target describe --tags --exact-match 2>/dev/null
  )
  if [ "$target_branch" != "$branch" ]; then
    return 12
  fi

  return 0
}

git_can_clone() {
  target=$1
  url=$2
  branch=$3

  if [ -d $target ]; then
    empty_dir=$(ls -A $target 2>/dev/null)
    if [ -n empty_dir ]; then
      return 13
    fi
  else
    if [ -e $target ]; then
      return 14
    fi
  fi

  return 0
}

git_pull() {
  target=$1
  url=$2
  branch=$3

  # Can pull git?
  git_can_pull $@
  res=$?; if [ $res -ne 0 ]; then
    return $res
  fi

  # Get commit hash before pull
  last_commit=$(git -C $target rev-parse HEAD 2>/dev/null)
  if [ $? -ne 0 ]; then
    errmsg=$(git -C $target rev-parse HEAD 2>&1 >/dev/null)
    
    printf "git_pull: Error occured while 'git rev-parse HEAD'\n"
    printf "  target: $target\n"
    printf "  url: $url\n"
    printf "  branch: $branch\n"
    printf "  error message: $errmsg\n"
    
    return 2 # undefined error
  fi

  # Git pull
  errmsg=$(git -C $target pull --rebase --quiet 2>&1 >/dev/null)
  if [ $? -ne 0 ]; then
    printf "git_pull: Error occured while 'git pull --rebase'\n"
    printf "  target: $target\n"
    printf "  url: $url\n"
    printf "  branch: $branch\n"
    printf "  error message: $errmsg\n"

    return 2 # undefined error
  fi

  # Check commit hash after pull
  current_commit=$(git -C $target rev-parse HEAD 2>/dev/null)
  if [ $? -ne 0 ]; then
    errmsg=$(git -C $target rev-parse HEAD 2>&1 >/dev/null)
    
    printf "git_pull: Error occured while 'git rev-parse HEAD' after git pull\n"
    printf "  target: $target\n"
    printf "  url: $url\n"
    printf "  branch: $branch\n"
    printf "  error message: $errmsg\n"
    
    return 2 # undefined error
  fi
  
  # already up to date
  if [ "$current_commit" = "$last_commit" ]; then
    return 15
  fi

  return 0
}

git_clone() {
  target=$1
  url=$2
  branch=$3

  # Can git clone?
  git_can_clone $@
  res=$?; if [ $res -ne 0 ]; then
    return $res
  fi
  
  # Git clone
  errmsg=$(git clone --quiet --depth 1 --branch "$branch" "$url" "$target" 2>&1 >/dev/null)
  if [ $? -ne 0 ]; then
    printf "git_clone: Error occured while 'git clone --depth 1'\n"
    printf "  target: $target\n"
    printf "  url: $url\n"
    printf "  branch: $branch\n"
    printf "  error message: $errmsg\n"

    return 2 # undefined error
  fi

  return 0
}

git_sync() {
  target=$1
  url=$2
  branch=$3

  printf "Git synchronizing '$url' '$branch'\n"
  
  _git_sync $@
  res=$?; if [ $res -ne 0 ] && [ $res -ne 15 ]; then
    printf "  -> failed git sync\n"
    return $res
  fi
  
  return 0
}

_git_sync() {
  git_can_pull $@
  if [ $? -eq 0 ]; then
    git_pull $@
    return
  fi
  
  git_can_clone $@
  if [ $? -eq 0 ]; then
    git_clone $@
    return
  fi
}
