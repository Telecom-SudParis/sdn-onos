#!/bin/bash

echo -e "CONTAINER ID\tNAME\t\tIP ADDRESS\t\tVETH (HOST)"

for cid in $(docker ps -q); do
  name=$(docker inspect --format '{{.Name}}' "$cid" | sed 's/\///')
  ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$cid")
  pid=$(docker inspect -f '{{.State.Pid}}' "$cid")

  # Skip if we couldn't get required info
  if [ -z "$ip" ] || [ -z "$pid" ]; then
    continue
  fi

  # Find all interfaces inside the container namespace
  for intf in $(ls /proc/$pid/root/sys/class/net/); do
    # Skip lo
    [ "$intf" = "lo" ] && continue

    # Get iflink (host-side veth index)
    iflink=$(cat /proc/$pid/root/sys/class/net/$intf/iflink)

    # Match host interface with same ifindex
    veth=$(ip -o link | grep ": " | while read -r line; do
      ifname=$(echo "$line" | awk -F': ' '{print $2}' | cut -d@ -f1)
      ifindex=$(cat /sys/class/net/$ifname/ifindex 2>/dev/null)
      if [ "$ifindex" = "$iflink" ]; then
        echo "$ifname"
        break
      fi
    done)

    [ -n "$veth" ] && break
  done

  echo -e "$cid\t$name\t$ip\t$veth"
done


