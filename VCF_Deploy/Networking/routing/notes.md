# Important commands

- you need to disable bgp ebgp-requires-policy using the following command

``` bash
- config t
- router bgp 65007
- no bgp ebgp-requires-policy
```

- Check if the route are propagated

```bash
leftrouter# show bgp ipv4 unicast neighbors 192.168.0.253 advertised-routes
BGP table version is 28, local router ID is 192.168.0.201, vrf id 0
Default local pref 100, local AS 65008
Status codes:  s suppressed, d damped, h history, * valid, > best, = multipath,
               i internal, r RIB-failure, S Stale, R Removed
Nexthop codes: @NNN nexthop's vrf id, < announce-nh-self
Origin codes:  i - IGP, e - EGP, ? - incomplete
RPKI validation codes: V valid, I invalid, N Not found

  Network          Next Hop            Metric LocPrf Weight Path
*> 10.27.108.0/24   0.0.0.0                                0 65001 ?
*> 10.27.108.253/32 0.0.0.0                                0 65001 ?
*> 172.16.11.0/24   0.0.0.0                                0 65001 ?
*> 172.16.12.0/24   0.0.0.0                                0 65001 ?
*> 172.16.13.0/24   0.0.0.0                                0 65001 ?
*> 172.16.14.0/24   0.0.0.0                                0 65001 ?
*> 172.16.15.0/24   0.0.0.0                                0 65001 ?
*> 172.16.16.0/24   0.0.0.0                                0 65001 ?
*> 172.16.17.0/24   0.0.0.0                                0 65001 ?
*> 172.16.18.0/24   0.0.0.0                                0 65001 ?
*> 172.16.21.0/24   0.0.0.0                                0 65001 ?
*> 172.16.22.0/24   0.0.0.0                                0 65001 ?
*> 172.16.23.0/24   0.0.0.0                                0 65001 ?
*> 172.16.24.0/24   0.0.0.0                                0 65001 ?
*> 172.16.25.0/24   0.0.0.0                                0 65001 ?
*> 172.16.26.0/24   0.0.0.0                                0 65001 ?
*> 172.16.27.0/24   0.0.0.0                                0 65001 ?
*> 172.18.11.0/24   0.0.0.0                                0 65001 65007 i
*> 172.18.12.0/24   0.0.0.0                                0 65001 65007 i
*> 172.18.13.0/24   0.0.0.0                                0 65001 65007 i
*> 172.18.14.0/24   0.0.0.0                                0 65001 65007 i
*> 172.18.17.0/24   0.0.0.0                                0 65001 65007 i
*> 172.18.18.0/24   0.0.0.0                                0 65001 65007 i
*> 172.18.19.0/24   0.0.0.0                                0 65001 65007 i
*> 172.18.22.0/24   0.0.0.0                  0         32768 i
*> 172.18.23.0/24   0.0.0.0                  0         32768 i
*> 172.18.24.0/24   0.0.0.0                  0         32768 i
*> 192.168.0.0/16   0.0.0.0                                0 65001 ?

```
Check what routes are learned via BGP

```bash
leftrouter# show ip route bgp
Codes: K - kernel route, C - connected, S - static, R - RIP,
       O - OSPF, I - IS-IS, B - BGP, E - EIGRP, N - NHRP,
       T - Table, v - VNC, V - VNC-Direct, A - Babel, F - PBR,
       f - OpenFabric,
       > - selected route, * - FIB route, q - queued, r - rejected, b - backup
       t - trapped, o - offload failure

B>* 10.27.108.0/24 [20/0] via 192.168.0.253, ens192, weight 1, 11:06:13
B>* 10.27.108.253/32 [20/0] via 192.168.0.253, ens192, weight 1, 11:06:13
B>* 172.16.11.0/24 [20/0] via 192.168.0.253, ens192, weight 1, 11:06:13
B>* 172.16.12.0/24 [20/0] via 192.168.0.253, ens192, weight 1, 11:06:13
B>* 172.16.13.0/24 [20/0] via 192.168.0.253, ens192, weight 1, 11:06:13
B>* 172.16.14.0/24 [20/0] via 192.168.0.253, ens192, weight 1, 11:06:13
B>* 172.16.15.0/24 [20/0] via 192.168.0.253, ens192, weight 1, 11:06:13
B>* 172.16.16.0/24 [20/0] via 192.168.0.253, ens192, weight 1, 11:06:13
B>* 172.16.17.0/24 [20/0] via 192.168.0.253, ens192, weight 1, 11:06:13
B>* 172.16.18.0/24 [20/0] via 192.168.0.253, ens192, weight 1, 11:06:13
B>* 172.16.21.0/24 [20/0] via 192.168.0.253, ens192, weight 1, 11:06:13
B>* 172.16.22.0/24 [20/0] via 192.168.0.253, ens192, weight 1, 11:06:13
B>* 172.16.23.0/24 [20/0] via 192.168.0.253, ens192, weight 1, 11:06:13
B>* 172.16.24.0/24 [20/0] via 192.168.0.253, ens192, weight 1, 11:06:13
B>* 172.16.25.0/24 [20/0] via 192.168.0.253, ens192, weight 1, 11:06:13
B>* 172.16.26.0/24 [20/0] via 192.168.0.253, ens192, weight 1, 11:06:13
B>* 172.16.27.0/24 [20/0] via 192.168.0.253, ens192, weight 1, 11:06:13
B   172.18.11.0/24 [20/0] via 192.168.0.200, ens192, weight 1, 11:06:13
B>* 172.18.12.0/24 [20/0] via 192.168.0.200, ens192, weight 1, 11:06:13
B>* 172.18.13.0/24 [20/0] via 192.168.0.200, ens192, weight 1, 11:06:13
B>* 172.18.14.0/24 [20/0] via 192.168.0.200, ens192, weight 1, 11:00:13
B   172.18.17.0/24 [20/0] via 192.168.0.200, ens192, weight 1, 11:00:04
B   172.18.18.0/24 [20/0] via 192.168.0.200, ens192, weight 1, 11:00:01
B   172.18.19.0/24 [20/0] via 192.168.0.200, ens192, weight 1, 10:59:58
B   192.168.0.0/16 [20/0] via 192.168.0.253 inactive, weight 1, 11:06:13
```

## How to publish network in FRR

- you need to go to Router, and then address-family and then network which you want to publish-


### Command which i found useful

`show bgp ipv4 unicast`

-------------------- example -------------------------

```bash

rightrouter# show bgp ipv4 unicast


BGP table version is 34, local router ID is 192.168.0.200, vrf id 0
Default local pref 100, local AS 65007
Status codes:  s suppressed, d damped, h history, * valid, > best, = multipath,
               i internal, r RIB-failure, S Stale, R Removed
Nexthop codes: @NNN nexthop's vrf id, < announce-nh-self
Origin codes:  i - IGP, e - EGP, ? - incomplete
RPKI validation codes: V valid, I invalid, N Not found

    Network          Next Hop            Metric LocPrf Weight Path
 *> 10.27.108.0/24   192.168.0.253            0             0 65001 ?
 *> 10.27.108.253/32 192.168.0.253            0             0 65001 ?
 *> 172.16.11.0/24   192.168.0.253            0             0 65001 ?
 *> 172.16.12.0/24   192.168.0.253            0             0 65001 ?
 *> 172.16.13.0/24   192.168.0.253            0             0 65001 ?
 *> 172.16.14.0/24   192.168.0.253            0             0 65001 ?
 *> 172.16.15.0/24   192.168.0.253            0             0 65001 ?
 *> 172.16.16.0/24   192.168.0.253            0             0 65001 ?
 *> 172.16.17.0/24   192.168.0.253            0             0 65001 ?
 *> 172.16.18.0/24   192.168.0.253            0             0 65001 ?
 *> 172.16.21.0/24   192.168.0.253            0             0 65001 ?
 *> 172.16.22.0/24   192.168.0.253            0             0 65001 ?
 *> 172.16.23.0/24   192.168.0.253            0             0 65001 ?
 *> 172.16.24.0/24   192.168.0.253            0             0 65001 ?
 *> 172.16.25.0/24   192.168.0.253            0             0 65001 ?
 *> 172.16.26.0/24   192.168.0.253            0             0 65001 ?
 *> 172.16.27.0/24   192.168.0.253            0             0 65001 ?
 *> 172.18.11.0/24   0.0.0.0                  0         32768 i
 *> 172.18.12.0/24   0.0.0.0                  0         32768 i
 *> 172.18.13.0/24   0.0.0.0                  0         32768 i
 *> 172.18.14.0/24   0.0.0.0                  0         32768 i
 *> 172.18.17.0/24   0.0.0.0                  0         32768 i
 *> 172.18.18.0/24   0.0.0.0                  0         32768 i
 *> 172.18.19.0/24   0.0.0.0                  0         32768 i
 *> 172.18.22.0/24   192.168.0.201                          0 65001 65008 i
 *> 172.18.23.0/24   192.168.0.201                          0 65001 65008 i
 *> 172.18.24.0/24   192.168.0.201                          0 65001 65008 i
 *> 192.168.0.0/16   192.168.0.253            0             0 65001 ?

```






## Reference

- https://docs.frrouting.org/en/latest/bgp.html#clicmd-bgp-ebgp-requires-policy
- https://www.noction.com/blog/debug-bgp-states
- 