# sdn-onos
This tutorial will help you to get started with the ONOS Controller and Mininet.

## Prerequisite:
You need to be able to run the onos-tutorial-1.15.0 VM, which can be downloaded from this link https://drive.google.com/file/d/1JcGUJJDTtbHNnbFzC7SUK52RmMDBVUry/view

## Table of contents
1. [Getting started with OpenvSwitch and ONOS](#ovs-onos)
2. [Create ONOS SDN controller Serivce](#svc-onos)
3. [Create GUI application (v2.0) Deployment](#dpl-gui-20)
4. [Create Mininet cluster](#dpl-mininet)
5. [Upgrade ONOS SDN controller latest version (v2.4.0)](#dpl-onos-latest)
6. [Upgrade GUI application latest version](#dpl-gui-latest)
7. [Create Forwarding application Deployment](#dpl-fwd)

## Getting started with OpenvSwitch and ONOS <a name="ovs-onos"></a>
Open a Terminal and execute the following command to create an OvS switch
```
sudo ovs-vsctl add-br br1
```

Show OvS description
```
sudo ovs-vsctl show
```

Run "Setup ONOS Cluster" to start ONOS controller => A new Terminal appears with the ONOS CLI prompt

Run "ONOS GUI" to access ONOS Web Interface

Establish an OpenFlow session to ONOS
```
sudo ovs-vsctl set-controller br1 tcp:172.17.0.5:6653
```
A switch appears on ONOS GUI

Delete the bridge
```
sudo ovs-vsctl del-br br1
```

## Running Mininet with ONOS
