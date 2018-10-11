#!/bin/sh
set -e

CONFIG="$ZOO_CONF_DIR/zoo.cfg"

if [[ "$ZOO_TICK_TIME" != '' ]]; then
   sed -ri 's/^(# )?('"tickTime"'=).*/\2'"$ZOO_TICK_TIME"'/' "$CONFIG"
fi

if [[ "$ZOO_INIT_LIMIT" != '' ]]; then
   sed -ri 's/^(# )?('"initLimit"'=).*/\2'"$ZOO_INIT_LIMIT"'/' "$CONFIG"
fi

if [[ -v "$ZOO_SYNC_LIMIT" != '' ]]; then
   sed -ri 's/^(# )?('"syncLimit"'=).*/\2 '"$ZOO_SYNC_LIMIT"'/' "$CONFIG"
fi

if [[ "$ZOO_AUTOPURGE_PURGEINTERVAL" != '' ]]; then
   sed -i -r 's|#(autopurge.purgeInterval=*)|\1|g' "$CONFIG"
   sed -ri 's/^(# )?('"autopurge.purgeInterval"'=).*/\2'"$ZOO_AUTOPURGE_PURGEINTERVAL"'/' "$CONFIG"
fi

if [[ -v "$ZOO_AUTOPURGE_SNAPRETAINCOUNT" != '' ]]; then
        sed -i -r 's|#(autopurge.snapRetainCount=*)|\1|g' "$CONFIG"
    sed -ri 's/^(# )?('"autopurge.snapRetainCount"'=).*/\2'"$ZOO_AUTOPURGE_SNAPRETAINCOUNT"'/' "$CONFIG"
fi

if [[ -v "$ZOO_MAX_CLIENT_CNXNS" != '' ]]; then
   sed -i -r 's|#(maxClientCnxns=*)|\1|g' "$CONFIG"
   sed -ri 's/^(# )?('"maxClientCnxns"'=).*/\2'"$ZOO_MAX_CLIENT_CNXNS"'/' "$CONFIG"
fi

exec "$@"