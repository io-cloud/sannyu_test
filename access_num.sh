#!/bin/bash

LogList=$(awk '"[26/Feb/2018:20:00" < $4 && $4 < "[26/Feb/2018:23:00"' < "$1")
IpList=$(echo "$LogList" | awk '{ print $1 }' | sort | uniq)

echo "$IpList" | while read -r line; do
  IpAddr="$line"
  AccessNum=$(echo "$LogList" | grep -c "$IpAddr")
  echo "$AccessNum" "$IpAddr"
done
