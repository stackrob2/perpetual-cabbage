#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://stg-api.stackbit.com/project/5dc05e5b42508a0013ac0d13/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://stg-api.stackbit.com/pull/5dc05e5b42508a0013ac0d13
curl -s -X POST https://stg-api.stackbit.com/project/5dc05e5b42508a0013ac0d13/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://stg-api.stackbit.com/project/5dc05e5b42508a0013ac0d13/webhook/build/publish > /dev/null
