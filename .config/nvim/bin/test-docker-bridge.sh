#!/bin/bash

echo '----'
cwd=$1 && shift
container=$1 && shift

# WARN: This will break if flags other than -o and -f are added in neotest-rspec
# while getopts o:f: flag; do
# 	# This deliberately does not handle all arguments
# 	# shellcheck disable=SC2220
# 	# shellcheck disable=SC2213
# 	case "${flag}" in
# 		o) output_path=${OPTARG} ;;
# 		*) ;;
# 	esac
# done

args=("${@/$cwd\//}")

echo "${args[@]}"

# Run the tests
# docker-compose exec "$container" bundle exec bin/rspec "${args[@]}"

# Copy the test output from the container to the host
# docker-compose cp "$container:$output_path" "$output_path"
# echo "$container:$output_path" "$output_path"

