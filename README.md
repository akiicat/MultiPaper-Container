# MultiPaper Container

This repository will automatically push the latest MulitPaper containers to Docker Hub.

- [MultiPaper Server Image](https://hub.docker.com/repository/docker/akiicat/multipaper)
- [MultiPaper Master Image](https://hub.docker.com/repository/docker/akiicat/multipaper-master)

## MultiPaper

MultiPaper is a scalable minecraft server. Any MultiPaper configuration please refer to [this repo](https://github.com/PureGero/MultiPaper).

## Usage

### Running Master Container

```shell
docker run -d -p 35353:35353 akiicat/multipaper-master
```

### Running Server Container

If you want to customize server name, you can add `-DbungeecordName=server1` to `JAVA_TOOL_OPTIONS`.
More `JAVA_TOOL_OPTIONS` configuration please refer [here](https://github.com/PureGero/MultiPaper/blob/main/MULTIPAPER_YAML.md).

```shell
docker run -d \
        -p 25565:25565 \
        -e EULA=true \
        -e JAVA_TOOL_OPTIONS="-Xmx1G -DmultipaperMasterAddress=<your_ip_address>:35353" \
        akiicat/multipaper -nogui --log-strip-color
```

changing <your_ip_address> in command line to your master ip address. For example,

```shell
docker run -d \
        -p 25565:25565 \
        -e EULA=true \
        -e JAVA_TOOL_OPTIONS="-Xmx1G -DmultipaperMasterAddress=192.168.0.193:35353" \
        akiicat/multipaper
```

If you want to save runtime file out of the container, you can mount the directory to `/app` in contaner

```shell
docker run -d \
        -p 25565:25565 \
        -v <your_location>:/app \
        -e EULA=true \
        -e JAVA_TOOL_OPTIONS="-Xmx1G -DmultipaperMasterAddress=192.168.0.193:35353"
        akiicat/multipaper
```

**Server Configuration**

```shell
$ docker run --rm -ti --entrypoint /bin/sh akiicat/multipaper
/app # java -jar /multipaper-1.18.2-65.jar --help
Downloading mojang_1.18.2.jar
Applying patches
Starting org.bukkit.craftbukkit.Main
Option                                  Description
------                                  -----------
-?, --help                              Show the help
-C, --commands-settings <File: Yml      File for command settings (default:
  file>                                   commands.yml)
-P, --plugins <File: Plugin directory>  Plugin directory to use (default:
                                          plugins)
-S, --spigot-settings <File: Yml file>  File for spigot settings (default:
                                          spigot.yml)
-W, --universe, --world-container, --   World container (default: .)
  world-dir <File: Directory
  containing worlds>
--add-extra-plugin-jar, --add-plugin    Specify paths to extra plugin jars to
  <File: Jar file>                        be loaded in addition to those in
                                          the plugins folder. This argument
                                          can be specified multiple times,
                                          once for each extra plugin jar path.
--add-extra-plugin-jars, --add-plugin-  Specify paths of a directory
  dir, --add-plugin-directory <File:      containing extra plugin jars to be
  Plugin directory>                       loaded in addition to those in the
                                          plugins folder. This argument can be
                                          specified multiple times, once for
                                          each extra plugin directory path.
-b, --bukkit-settings <File: Yml file>  File for bukkit settings (default:
                                          bukkit.yml)
-c, --config <File: Properties file>    Properties file to use (default:
                                          server.properties)
-d, --date-format <SimpleDateFormat:    Format of the date to display in the
  Log date format>                        console (for log entries)
--demo                                  Demo mode
--eraseCache                            Whether to force cache erase during
                                          world upgrade
--forceUpgrade                          Whether to force a world upgrade
-h, --host, --server-ip <String:        Host to listen on
  Hostname or IP>
--log-append <Boolean: Log append>      Whether to append to the log file
                                          (default: true)
--log-count <Integer: Log count>        Specified how many log files to cycle
                                          through (default: 1)
--log-limit <Integer: Max log size>     Limits the maximum size of the log
                                          file (0 = unlimited) (default: 0)
--log-pattern <String: Log filename>    Specfies the log filename pattern
                                          (default: server.log)
--log-strip-color                       Strips color codes from log file
--multipaper, --multipaper-settings     File for multipaper settings (default:
  <File: Yml file>                        multipaper.yml)
--noconsole                             Disables the console
--nogui                                 Disables the graphical console
--nojline                               Disables jline and emulates the
                                          vanilla console
-o, --online-mode <Boolean:             Whether to use online authentication
  Authentication>
-p, --port, --server-port <Integer:     Port to listen on
  Port>
--paper, --paper-settings <File: Yml    File for paper settings (default:
  file>                                   paper.yml)
-s, --max-players, --size <Integer:     Maximum amount of players
  Server size>
--server-name <String: Name>            Name of the server (default: Unknown
                                          Server)
-v, --version                           Show the CraftBukkit Version
-w, --level-name, --world <String:      World name
  World name>
```

## Container Debug

List all log

```shell
docker logs <container_name>
```

Run a shell in container

```shell
docker run --rm -ti --entrypoint /bin/sh akiicat/multipaper
```

Run a shell to existed container

```shell
docker exec -ti akiicat/multipaper /bin/sh
```

