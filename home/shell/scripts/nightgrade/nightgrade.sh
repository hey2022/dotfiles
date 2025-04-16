#!/usr/bin/env bash

systemd-inhibit --what=idle:sleep:handle-lid-switch --why="topgrade upgrade" topgrade
