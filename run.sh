#!/bin/bash
pkill node
nohup node ./tools/sync.js &> sync.log &
nohup node ./app.js &> app.log &
nohup node ./tools/stats.js &> stats.log &
