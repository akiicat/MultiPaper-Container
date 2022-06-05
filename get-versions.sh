#!/bin/bash


# docker_hun_server_repo=${

github_server_tags=$(wget -q https://registry.hub.docker.com/v1/repositories/akiicat/test/tags -O -)
# docker_hub_server_tags=$(wget -q https://registry.hub.docker.com/v1/repositories/akiicat/test/tags -O -)
# docker_hub_master_tags=$(wget -q https://registry.hub.docker.com/v1/repositories/akiicat/test/tags -O -)

versions=($(curl -sS -X "GET" https://multipaper.io/api/v2/projects/multipaper | jq -r ".versions[]"))
for version in "${versions[@]}"; do
        builds=($(curl -sS -X "GET" https://multipaper.io/api/v2/projects/multipaper/versions/$version | jq -r ".builds[]"))

        for build in "${builds[@]}"; do
                echo "-> $version-$build"

                # is_exist=$(echo $docker_hub_server_tags | jq -r ".[].name" | grep "$version-$build")
                is_exist=$(echo $github_server_tags | jq -r ".[].name" | grep "$version-$build")

                if [ -n "$is_exist" ]; then
                        continue;
                fi

                set -x

                downloads=$(curl -sS -X "GET" https://multipaper.io/api/v2/projects/multipaper/versions/$version/builds/$build)

                master_jar=$(echo $downloads | jq -r ".downloads[].name" | grep -i    "master")
                server_jar=$(echo $downloads | jq -r ".downloads[].name" | grep -i -v "master")

                if [[ $master_jar =~ ([[:digit:]]+.[[:digit:]]+.[[:digit:]]+) ]]; then
                        master_version=${BASH_REMATCH[1]}
                fi
                server_version=$version-$build

                echo "Master Jar: $master_jar"
                echo "Server Jar: $server_jar"
                echo "master_version: $master_version"
                echo "server_version: $server_version"

                mkdir -p server
                mkdir -p master
                sed -e "s/{version}/$version/g" -e "s/{build}/$build/g" -e "s/{jar_file}/$server_jar/g" templates/Dockerfile.server > server/Dockerfile
                sed -e "s/{version}/$version/g" -e "s/{build}/$build/g" -e "s/{jar_file}/$master_jar/g" templates/Dockerfile.master > master/Dockerfile
                echo "$server_version" > server/tags
                echo "$master_version" > master/tags

                if [[ -n "$GITHUB_ENV" ]]; then
                        echo "VERSION=$version" >> $GITHUB_ENV
                        echo "BUILD=$build" >> $GITHUB_ENV
                        echo "SERVER_VERSION=$server_version" >> $GITHUB_ENV
                        echo "MASTER_VERSION=$master_version" >> $GITHUB_ENV
                fi

                exit
        done
done

# git branch -a
# git tag
#
# echo "$version $build"
#
# echo "$version" > version
# echo "$build" > build

# export version=$version
# export build=$build

# curl \
#   -X POST \
#   -H "Accept: application/vnd.github.v3+json" \
#   https://api.github.com/repos/OWNER/REPO/git/tags \
#   -d '{"tag":"v0.0.1","message":"initial version","object":"c3d0be41ecbe669545ee3e94d31ed9a4bc91ee3c","type":"commit","tagger":{"name":"Monalisa Octocat","email":"octocat@github.com","date":"2011-06-17T14:53:35-07:00"}}'


