#!/usr/bin/env bash

GREETER_BIN="$(which noctalia-greeter-session)"

sudo sed -i "/^\[default_session\]/,/^\[/ {
    s|^\(command *= *\).*|\1\"${GREETER_BIN}\"|
}" /etc/greetd/config.toml
