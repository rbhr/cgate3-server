#!/bin/sh

# Start C-Gate in background
java -jar cgate.jar > /dev/null 2>&1 &

# Wait for C-Gate to create its initial files
sleep 5

# Run tail in foreground
exec tail -F /cgate3/appdata/logs/event.txt
