#!/bin/bash

sim2h_server &
cargo install single_source &&
./test_release.sh hello_holo && ./test_release.sh hello_test && ./test_release.sh hello_gui && ./test_release.sh hello_me && ./test_release.sh hello_world && ./test_release.sh simple_micro_blog
