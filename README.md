# sdn-onos
This tutorial will help you to get started with the ONOS Controller and Mininet.

## Prerequisite:
You need to be able to run the onos-tutorial-1.15.0 VM, which can be downloaded from this link https://drive.google.com/file/d/1JcGUJJDTtbHNnbFzC7SUK52RmMDBVUry/view

## Table of contents
1. [Getting started with OpenvSwitch and ONOS](#ovs-onos)
2. [Running Mininet with custom topology](#mininet)
3. [Adding Flow Rules](#flow)


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

4.1/ Run "ONOS GUI" to access ONOS Web Interface or via the address with username/pwd is **karaf/karaf** or **onos/rocks**: 
```
http://172.17.0.5:8181/onos/ui/login.html
```

4.2/ Access the ONOS REST APIs as follows:
```
172.17.0.5:8181/onos/v1/docs/
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

![custom_topo](https://raw.githubusercontent.com/Telecom-SudParis/sdn-onos/main/topo/connected_topo.png)


## Adding Flow Rules <a name="flow"></a>
# Proactive Flow Insertion
**Prerequisite** Flows could be added via the REST API using Postman (Chrome Extension) and a Json Beautifier tool (https://jsonbeautifier.org/) 
1/ Send the **POST** method with the following URL and Content
```
http://172.17.0.5:8181/onos/v1/flows
```
```
{
  "flows": [
    {
      "priority": 9,
      "timeout": 3600,
      "isPermanent": false,
      "deviceId": "of:0000000000000001",
      "treatment": {
        "instructions": [
          {
            "type": "OUTPUT",
            "port": "5"
          }
        ],
        "deferred": []
      },
      "selector": {
        "criteria": [
          {
            "type": "ETH_TYPE",
            "ethType": "0x800"
          },
          {
            "type": "IN_PORT",
            "port": 2
          },
          {
            "type": "IPV4_DST",
            "ip": "10.0.0.3/32"
          },
          {
            "type": "IPV4_SRC",
            "ip": "10.0.0.1/32"
          }
        ]
      }
    },
    {
      "priority": 9,
      "timeout": 3600,
      "isPermanent": false,
      "deviceId": "of:0000000000000005",
      "treatment": {
        "instructions": [
          {
            "type": "OUTPUT",
            "port": "4"
          }
        ],
        "deferred": []
      },
      "selector": {
        "criteria": [
          {
            "type": "ETH_TYPE",
            "ethType": "0x800"
          },
          {
            "type": "IN_PORT",
            "port": 1
          },
          {
            "type": "IPV4_DST",
            "ip": "10.0.0.3/32"
          },
          {
            "type": "IPV4_SRC",
            "ip": "10.0.0.1/32"
          }
        ]
      }
    },
    {
      "priority": 9,
      "timeout": 3600,
      "isPermanent": false,
      "deviceId": "of:0000000000000003",
      "treatment": {
        "instructions": [
          {
            "type": "OUTPUT",
            "port": "4"
          }
        ],
        "deferred": []
      },
      "selector": {
        "criteria": [
          {
            "type": "ETH_TYPE",
            "ethType": "0x800"
          },
          {
            "type": "IN_PORT",
            "port": 5
          },
          {
            "type": "IPV4_DST",
            "ip": "10.0.0.3/32"
          },
          {
            "type": "IPV4_SRC",
            "ip": "10.0.0.1/32"
          }
        ]
      }
    },
    {
      "priority": 9,
      "timeout": 3600,
      "isPermanent": false,
      "deviceId": "of:0000000000000003",
      "treatment": {
        "instructions": [
          {
            "type": "OUTPUT",
            "port": "5"
          }
        ],
        "deferred": []
      },
      "selector": {
        "criteria": [
          {
            "type": "ETH_TYPE",
            "ethType": "0x800"
          },
          {
            "type": "IN_PORT",
            "port": 4
          },
          {
            "type": "IPV4_DST",
            "ip": "10.0.0.1/32"
          },
          {
            "type": "IPV4_SRC",
            "ip": "10.0.0.3/32"
          }
        ]
      }
    },
    {
      "priority": 9,
      "timeout": 3600,
      "isPermanent": false,
      "deviceId": "of:0000000000000005",
      "treatment": {
        "instructions": [
          {
            "type": "OUTPUT",
            "port": "1"
          }
        ],
        "deferred": []
      },
      "selector": {
        "criteria": [
          {
            "type": "ETH_TYPE",
            "ethType": "0x800"
          },
          {
            "type": "IN_PORT",
            "port": 4
          },
          {
            "type": "IPV4_DST",
            "ip": "10.0.0.1/32"
          },
          {
            "type": "IPV4_SRC",
            "ip": "10.0.0.3/32"
          }
        ]
      }
    },
    {
      "priority": 9,
      "timeout": 3600,
      "isPermanent": false,
      "deviceId": "of:0000000000000001",
      "treatment": {
        "instructions": [
          {
            "type": "OUTPUT",
            "port": "2"
          }
        ],
        "deferred": []
      },
      "selector": {
        "criteria": [
          {
            "type": "ETH_TYPE",
            "ethType": "0x800"
          },
          {
            "type": "IN_PORT",
            "port": 5
          },
          {
            "type": "IPV4_DST",
            "ip": "10.0.0.1/32"
          },
          {
            "type": "IPV4_SRC",
            "ip": "10.0.0.3/32"
          }
        ]
      }
    }
  ]
}
```

2/ To delete all flows added by the REST API, send **DELETE** method to:
```
http://172.17.0.5:8181/onos/v1/flows/application/org.onosproject.rest
```
# Reactive Flow Insertion
1/ Flows are added on packet arrival using the Forwarding app
```
app activate fwd
```

2/ To deactivate app
```
app deactivate fwd
```

