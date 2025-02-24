#!/bin/bash

github_server_tags=$(git ls-remote --tags)

versions=($(curl -sS -X "GET" https://api.multipaper.io/v2/projects/multipaper | jq -r ".versions[]"))
for version in "${versions[@]}"; do
        echo "Version: $version"

        builds=($(curl -sS -X "GET" https://api.multipaper.io/v2/projects/multipaper/versions/$version | jq -r ".builds[]"))
        for build in "${builds[@]}"; do
                echo "Version: $build"

                is_exist=$(echo "$github_server_tags" | grep "$version-$build")

                if [ -n "$is_exist" ]; then
                        continue;
                fi

                echo "The next version: $version-$build"

                downloads=$(curl -sS -X "GET" https://api.multipaper.io/v2/projects/multipaper/versions/$version/builds/$build)

                master_jar=$(echo "$downloads" | jq -r ".downloads[].name" | grep -i    "master")
                server_jar=$(echo "$downloads" | jq -r ".downloads[].name" | grep -i -v "master")

                if [[ $master_jar =~ ([[:digit:]]+.[[:digit:]]+.[[:digit:]]+) ]]; then
                        master_version=${BASH_REMATCH[1]}
                fi
                server_version=$version-$build

                echo "Master Jar: $master_jar"
                echo "Server Jar: $server_jar"
                echo "master_version: $master_version"
                echo "server_version: $server_version"

                if [[ -z "$master_version" ]]; then
                        echo "Next: No master version found"
                        continue
                fi

                mkdir -p server
                mkdir -p master
                sed -e "s/{version}/$version/g" -e "s/{build}/$build/g" -e "s/{jar_file}/$server_jar/g" templates/Dockerfile.server > server/Dockerfile
                sed -e "s/{version}/$version/g" -e "s/{build}/$build/g" -e "s/{jar_file}/$master_jar/g" templates/Dockerfile.master > master/Dockerfile
                echo "$server_version" > server/tags
                echo "$master_version" > master/tags

                if [[ -n "$GITHUB_ENV" ]]; then
                        echo "VERSION=$version" >> $GITHUB_ENV
                        echo "BUILD=$build" >> $GITHUB_ENV
                        echo "MASTER_VERSION=$master_version" >> $GITHUB_ENV
                        echo "SERVER_VERSION=$server_version" >> $GITHUB_ENV
                fi

                exit
        done
done

