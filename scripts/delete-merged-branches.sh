#!/bin/bash
git fetch --all --prune
git branch -a
git checkout develop
git branch -r --merged origin/develop

# Find merged feature branches and delete them
merged_branches=$(git branch -r --merged origin/develop | grep 'origin/feature-' | sed 's/origin\///')
for branch in $merged_branches; do
  echo "Deleting remote branch: $branch"
  git push origin --delete "$branch"
done
