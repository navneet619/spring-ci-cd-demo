#!/bin/bash
is_running=$(ps -ef | grep 'spring-ci-cd-demo' | grep -v grep | wc -l)
if [ $is_running -gt 0 ]; then
    pkill -f 'spring-ci-cd-demo'
fi