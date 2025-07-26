#!/usr/bin/env bash

# shellcheck disable=SC2154
if [ "$lidarr_eventtype" = "Test" ]; then
    beet version
    exit 0
fi

# shellcheck disable=SC2154
bin/beet import -q "$lidarr_artist_path"
