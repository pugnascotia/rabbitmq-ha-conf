#!/bin/bash

set -e

if [ "$1" = 'configure-rabbitmq-ha' ]; then

    # Let rabbit come up
    sleep ${RABBITMQ_HA_DELAY:-10}

    # http://stackoverflow.com/a/1655389 and comments
    # Since `read` returns non-zero when it sees EOF, we need the `|| true`
    # as we're running under `set -e`.
    read -r -d '' POLICY_JSON <<EOF || true
{
    "ha-mode": "${RABBITMQ_HA_MODE:-all}"
}
EOF

    exec rabbitmqctl set_policy \
        "${RABBIT_HA_POLICY_NAME:-ha-all}" \
        "${RABBIT_MIRROR_QUEUE_PATTERN:-.}" \
        "$POLICY_JSON"
fi

exec "$@"
