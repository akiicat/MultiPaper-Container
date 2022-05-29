#!/bin/bash

versions=$(curl -sS -X "GET" https://multipaper.io/api/v2/projects/multipaper | jq -r ".versions[]")
versions=($versions)


for version in "${versions[@]}"; do
        echo "-> " $version

        builds=$(curl -sS -X "GET" https://multipaper.io/api/v2/projects/multipaper/versions/$version | jq -r ".builds[]")
        builds=($builds)

        for build in "${builds[@]}"; do
                echo "---> " $build

                break
        done
        break
done

set -x
date > time.txt

echo "$version $build"

INPUT_BRANCH="feature-123-$build"
INPUT_COMMIT_USER_NAME="My GitHub Actions Bot"
INPUT_COMMIT_USER_EMAIL="my-github-actions-bot@example.org"
INPUT_COMMIT_AUTHOR="Author <actions@github.com>"
INPUT_COMMIT_MESSAGE="Auto Commit"


git checkout -B "$INPUT_BRANCH" --

git add .

git -c user.name="$INPUT_COMMIT_USER_NAME" -c user.email="$INPUT_COMMIT_USER_EMAIL" \
        --author="$INPUT_COMMIT_AUTHOR" \
        commit -m "$INPUT_COMMIT_MESSAGE"

# git push
git push --set-upstream origin $INPUT_BRANCH

# curl \
#   -X POST \
#   -H "Accept: application/vnd.github.v3+json" \
#   https://api.github.com/repos/OWNER/REPO/git/tags \
#   -d '{"tag":"v0.0.1","message":"initial version","object":"c3d0be41ecbe669545ee3e94d31ed9a4bc91ee3c","type":"commit","tagger":{"name":"Monalisa Octocat","email":"octocat@github.com","date":"2011-06-17T14:53:35-07:00"}}'


