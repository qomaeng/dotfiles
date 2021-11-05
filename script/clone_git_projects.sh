#!/bin/sh

BASEDIR=$(dirname "$0")
listfile="$BASEDIR/git_projects"

can_pull() {
  target=$1
  url=$2
  branch=$3

  [ -f "$target/.git/config" ] || return 1

  target_origin=$(git -C $target remote get-url origin)
  [ "$target_origin" = "$url" ] || return 1

  target_branch=$(
    git -C $target symbolic-ref -q --short HEAD 2>/dev/null ||
    git -C $target describe --tags --exact-match 2>/dev/null
  )
  [ "$target_branch" = "$branch" ] || return 1

  return 0
}

can_clone() {
  target=$1
  url=$2
  branch=$3

  prj_name=${url##*/}
  prj_name=${prj_name%.*}

  if [ "$(basename $target)" = "$prj_name" ]; then
  fi

}

printf ":: Downloading git projects...\n"
ret=0

cat "$listfile" | sed '/^$/d' | while read target url branch
do
  target=${target/#\~/$HOME}
  last_commit=$(git -C $target rev-parse HEAD 2>/dev/null)

  printf "Cloning git project: $url\n"

  if git -C $target pull --rebase --stat --depth 1 --quiet origin $branch 2>/dev/null; then
    current_commit=$(git -C $target rev-parse HEAD 2>/dev/null)
    if [[ "$current_commit" = "$last_commit" ]]; then
      printf " already up to date: ${url}\n"
    else
      printf " cloned git project: ${url}\n"
    fi
  else
    ret=$?
    printf " -> Failed to pull: '${url}' at '${target}'\n"
    printf "    target: ${target}, url: ${url}, branch: ${branch}\n"
    printf "Stopping git projects downlading...\n"
  fi
done

printf ":: Finished git projects downloading\n"

exit $ret
