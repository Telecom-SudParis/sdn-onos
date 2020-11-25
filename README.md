# sdn-onos
This tutorial will help you to get started with the ONOS Controller and Mininet.

## Prerequisite:
You need to be able to run the onos-tutorial-1.15.0 VM, which can be downloaded from this link https://drive.google.com/file/d/1JcGUJJDTtbHNnbFzC7SUK52RmMDBVUry/view

## Table of contents
1. [Getting started with OpenvSwitch and ONOS](#ovs-onos)
2. [Running Mininet with custom topology](#mininet)
3. [Create GUI application (v2.0) Deployment](#dpl-gui-20)


## Getting started with OpenvSwitch and ONOS <a name="ovs-onos"></a>
1/ Open a Terminal and execute the following command to create an OvS switch
```
sudo ovs-vsctl add-br br1
```

2/ Show OvS description
```
sudo ovs-vsctl show
```

3/ Run "Setup ONOS Cluster" to start ONOS controller => A new Terminal appears with the ONOS CLI prompt

4/ Run "ONOS GUI" to access ONOS Web Interface or via the address with username/pwd is **karaf/karaf** or **onos/rocks**: 
```
http://172.17.0.5:8181/onos/ui/login.html
```

5/ Establish an OpenFlow session to ONOS
```
sudo ovs-vsctl set-controller br1 tcp:172.17.0.5:6653
```
6/ Delete the bridge
```
sudo ovs-vsctl del-br br1
```

## Running Mininet with custom topology <a name="mininet"></a>
1/ In a Terminal, execute the command to emulate a simple topology with 1 switch and 2 hosts
```
sudo mn -c;
sudo mn --controller=remote,ip=172.17.0.5,port=6653
```

2/ Press **Ctrl+D** to exit mininet

3/ Download and run the custom topology 
```
curl https://raw.githubusercontent.com/Telecom-SudParis/sdn-onos/main/topo/connected_topo.py > connected_topo.py;
sudo mn -c;
sudo python connected_topo.py
```

4/ Observe the custom topology on ONOS GUI

https://github.com/Telecom-SudParis/sdn-onos/blob/main/topo/connected_topo.png


