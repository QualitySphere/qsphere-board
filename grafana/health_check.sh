#!/bin/sh
set -ex
curl -s --head http://0.0.0.0:3000 | grep '200 OK'