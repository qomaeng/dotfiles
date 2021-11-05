#!/bin/sh

BASEDIR=$(dirname "$0")

listfile="$BASEDIR/git_projects"

printf ":: Synchronizing git projects...\n"
ret=0

cat "$listfile" | sed '/^$/d' | while read target url branch
do
  target=${target/#\~/$HOME}
  last_commit=$(git -C $target rev-parse HEAD 2>/dev/null)

  printf "Pulling git project: $url\n"

  if git -C $target pull --rebase --stat --depth 1 --quiet origin $branch 2>/dev/null; then
    current_commit=$(git -C $target rev-parse HEAD 2>/dev/null)
    if [[ "$current_commit" = "$last_commit" ]]; then
      printf " already up to date: ${url}\n"
    else
      printf " pulled git project: ${url}\n"
    fi
  else
    ret=$?
    printf " -> Failed to pull: '${url}' at '${target}'\n"
    printf "    target: ${target}, url: ${url}, branch: ${branch}\n"
    printf "Stopping git projects synchronizing...\n"
  fi
done

printf ":: Finished git projects synchronizing\n"

exit $ret

