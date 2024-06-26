#!/bin/sh

# pull the latest version of the app
git pull > /dev/null

# install any new dependencies
pip install --root-user-action=ignore -r requirements.txt > /dev/null

# be sure to have latest version of selenium
pip install selenium --upgrade

# remove temp file when previous execution crashed
rm /tmp/.X99-lock

# set display port and dbus env to avoid hanging (https://github.com/joyzoursky/docker-python-chromedriver)
export DISPLAY=:99
export DBUS_SESSION_BUS_ADDRESS=/dev/null

# start vxfb
Xvfb :99 -screen 0 1280x800x8 -nolisten tcp &

# start the script
exec "$@"
