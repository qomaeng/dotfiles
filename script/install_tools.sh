#!/bin/sh

BASEDIR=$(dirname "$0")
listfile="$BASEDIR/tools"

can_git_pull() {
  target=$1
  url=$2
  branch=$3

  if [ ! -f "$target/.git/config" ]; then
    return 1
  fi

  target_origin=$(git -C $target remote get-url origin)
  if [ "$target_origin" != "$url" ]; then
    return 1
  fi

  target_branch=$(
    git -C $target symbolic-ref -q --short HEAD 2>/dev/null ||
    git -C $target describe --tags --exact-match 2>/dev/null
  )
  if [ "$target_branch" != "$branch" ]; then
    return 1
  fi

  return 0
}

can_git_clone() {
  target=$1

  if [ -d $target ] && [ ls -A $target &>/dev/null = "" ]; then
    return 0
  fi

  if [ ! -e $target ]; then
    return 0
  fi

  return 1
}

git_pull() {
  target=$1
  url=$2
  branch=$3

  last_commit=$(git -C $target rev-parse HEAD 2>/dev/null)

  printf "Pulling git project: $url\n"
  error_msg=$(git -C $target pull --rebase --quiet 2>&1 1>/dev/null)

  if [ $? = 0 ]; then
    current_commit=$(git -C $target rev-parse HEAD 2>/dev/null)
    if [[ "$current_commit" = "$last_commit" ]]; then
      printf "  already up to date\n"
    fi

    return 0
  else
    printf "  failed:\n"
    printf "    target: $target, branch: $branch\n"
    printf "    error message:\n"
    printf "      $error_msg\n"

    return 1
  fi
}

git_clone() {
  target=$1
  url=$2
  branch=$3

  printf "Cloning git project: $url\n"
  error_msg=$(git clone --quiet --depth 1 --branch "$branch" "$url" "$target" 2>&1 >/dev/null)

  if [ $? = 0 ]; then
    return 0
  else
    printf "  failed:\n"
    printf "    target: $target, branch: $branch\n"
    printf "    error message:\n"
    printf "      $error_msg\n"

    return 1
  fi
}

printf ":: Installing tools...\n"

cat "$listfile" | sed '/^$/d' | while read target url branch
do
  target=${target/#\~/$HOME}

  if can_git_pull "$target" "$url" "$branch"; then
    git_pull "$target" "$url" "$branch"
  elif can_git_clone "$target" "$url" "$branch"; then
    git_clone "$target" "$url" "$branch"
  else
    printf "* Cannot install tool: $url\n"
    printf " -> Stopping to install tools...\n"
    break
  fi

  if [ $? != 0 ]; then
    printf "* Error occured while installing tool: $url\n"
    printf "    target: $target, branch: $branch\n"
    printf " -> Stopping to install tools...\n"
    break;
  fi
done

printf ":: Finished to install tools\n"

