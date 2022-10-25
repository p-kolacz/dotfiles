#!/bin/bash

file="/tmp/gpu"
[ -e $file ] && ([ $(cat $file) == intel ] && echo -n  || echo -n  ) || echo X

