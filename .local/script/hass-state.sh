#!/bin/bash

URL=http://10.0.0.2:8123

curl \
	--silent \
	-H "Authorization: Bearer $HASS_API_TOKEN" \
	-H "Content-Type: application/json" \
	"$URL/api/states/$1"
