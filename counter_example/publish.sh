#!/bin/bash

flutter build web --release "$@" --base-href="/counter_example/publish/" --output=publish