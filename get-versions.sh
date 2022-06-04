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

git branch -a
git tag

echo "$version $build"

echo "$version" > version
echo "$build" > build

# export version=$version
# export build=$build

# curl \
#   -X POST \
#   -H "Accept: application/vnd.github.v3+json" \
#   https://api.github.com/repos/OWNER/REPO/git/tags \
#   -d '{"tag":"v0.0.1","message":"initial version","object":"c3d0be41ecbe669545ee3e94d31ed9a4bc91ee3c","type":"commit","tagger":{"name":"Monalisa Octocat","email":"octocat@github.com","date":"2011-06-17T14:53:35-07:00"}}'


