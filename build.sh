#!/bin/bash

docker rmi multipaper:latest

docker build -t multipaper .

docker save --output multipaper.tar multipaper
sudo k3s ctr images import multipaper.tar

