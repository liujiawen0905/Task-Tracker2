#!/bin/bash
export MIX_ENV=prod
export PORT=6100
echo "Stopping old copy of app, if any..."

_build/prod/rel/task_tracker2/bin/task_tracker2 stop || true

echo "Starting app..."

# Start to run in background from shell.
#_build/prod/rel/tracker1/bin/tracker1 start
# Foreground for testing and for systemd
_build/prod/rel/task_tracker2/bin/task_tracker2 foreground
