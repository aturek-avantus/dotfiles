#!/usr/bin/env bash

git_done() {
  MAIN_BRANCH=${1:-master}
  git remote update --prune \
    && git co $MAIN_BRANCH \
    && git pull \
    && git branch --merged \
    | grep -v -E "\\*|$MAIN_BRANCH" \
    | xargs -n 1 git branch -d

  echo "done"
}
