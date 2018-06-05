#!/bin/bash

if [ "${USER_ID}" = "0" ] || [ "${USER_ID}" = "" ]; then
    # Run with "root"
    /bin/bash
else
    # Add local user(name=user) use USER_ID
    useradd --shell /bin/bash -u "${USER_ID}" -o -c "" -d /opt user
    # Can use sudo without password
    echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

    exec /usr/bin/gosu user "$@"
fi
