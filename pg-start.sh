#!/bin/sh

export PGDATA="$PWD/db"

pg_ctl -l "$PGDATA/server.log" start
