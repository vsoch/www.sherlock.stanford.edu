#!/bin/bash

#
# Deploy generated theme to web_docs
#
#   - fetch $TARGET_BRANCH
#   - sync $SOURCE_BRANCH/$SOURCE_DIR to $TARGET_BRANCH/$TARGET_DIR
#   - commit and push $TARGET_BRANCH
#

set -u 
set -e 

# $DEPLOY_KEY is set up in Travis 
REPO_URL="https://${DEPLOY_KEY}@github.com/stanford-rc/sherlock.git"

SOURCE_BRANCH="web_theme"
TARGET_BRANCH="web_docs"
TARGET_CLONE_DIR=$(mktemp "${TMPDIR:-/tmp/}${0##*/}.XXXXXXXXXXXX")

SOURCE_DIR=material/
TARGET_DIR=$TARGET_CLONE_DIR/theme/

# Pull requests and commits to other branches shouldn't try to deploy, just build to verify
if [ "$TRAVIS_PULL_REQUEST" != "false" -o "$TRAVIS_BRANCH" != "$SOURCE_BRANCH" ]; then
    echo "Skipping deploy"
    exit 0
fi

# Save some useful information
SHA=$(git rev-parse --short HEAD)
IFS="|" read COMMIT_AUTHOR_NAME COMMIT_AUTHOR_EMAIL < <(git show -s --format="%aN|%aE" $SHA)

# Clone the target branch into a temporary directory
# Create a new empty branch if the target branch doesn't exist yet (should only happen on first deply)
git clone --depth 1 --branch $TARGET_BRANCH --single-branch $REPO_URL $REPO $TARGET_CLONE_DIR
#cd $TARGET_CLONE_DIR
#git checkout $TARGET_BRANCH || git checkout --orphan $TARGET_BRANCH
#cd ..

# Copy the files we want to commit
rsync -avP --delete $SOURCE_DIR/ $TARGET_DIR/

# Now let's go commit and push
cd $TARGET_DIR

#git config user.name  "$COMMIT_AUTHOR_NAME"
#git config user.email "$COMMIT_AUTHOR_EMAIL"

git config user.email "travis@travis-ci.com"
git config user.name  "Travis CI"


# If there are no changes to the compiled out (e.g. this is a README update) then just bail.
if git diff --quiet; then
    echo "No changes to the output on this push; exiting."
    exit 0
fi

# Commit the "changes", i.e. the new version.
# The delta will show diffs between new and old versions.
cd $TARGET_DIR/
git add -A .
git commit -m "Deploy to $TARGET_BRANCH: ${SHA}\n\n\tTravis build: $TRAVIS_BUILD_NUMBER"

# Now that we're all set up, we can push.
git push $REPO_URL $TARGET_BRANCH
