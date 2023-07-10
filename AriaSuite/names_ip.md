## vrlcm

vrslcm1-md-vcf0-ko: 10.210.17.2

### Post Configuration

- Add Product Pack for vRealize Loginsight

## Standalone Workspace ONE Access

1. wsa-md-vcf0-ko: 10.210.16.1
2. Folder Name: wsa-fd-md-vcf0-ko
3. Size: Small
4. Segment: aria1-seg-md-vcf0-ko
5. IP: 10.210.16.1
6. NTP: ipam-node.services.debeka.test

## vRealize Operations Manager

Folder Name: md-vcf0-ko-fd-vrops
segment: aria2-seg-md-vcf0-ko
vrops-md-vcf0-ko:  10.210.17.8
vrops1-md-vcf0-ko: 10.210.17.9
vrops2-md-vcf0-ko: 10.210.17.10
vrops3-md-vcf0-ko: 10.210.17.11
Size: Medium

### Post Configuration

Configure start up policy

### FQDN

- vrops-md-vcf0-ko.vcf.debeka.test
- vrops1-md-vcf0-ko.vcf.debeka.test
- vrops2-md-vcf0-ko.vcf.debeka.test
- vrops3-md-vcf0-ko.vcf.debeka.test


## Clustered Workspace ONE Access

cwsa-md-vcf0-ko:  10.210.17.3
cwsa1-md-vcf0-ko: 10.210.17.4
cwsa2-md-vcf0-ko: 10.210.17.5
cwsa3-md-vcf0-ko: 10.210.17.6


## vRealize Automation

vra-md-vcf0-ko:  10.210.17.12
vra1-md-vcf0-ko: 10.210.17.13
vra2-md-vcf0-ko: 10.210.17.14
vra3-md-vcf0-ko: 10.210.17.15

## vRealize LogInsight

FolderName: md-vcf0-ko-fd-vrli
segment: aria1-seg-md-vcf0-ko

vrli-md-vcf0-ko:  10.210.16.2
vrli1-md-vcf0-ko: 10.210.16.3
vrli2-md-vcf0-ko: 10.210.16.4
vrli3-md-vcf0-ko: 10.210.16.5


### FQDN

cwsa-md-vcf0-ko.corp.local
cwsa1-md-vcf0-ko.corp.local
cwsa2-md-vcf0-ko.corp.local
cwsa3-md-vcf0-ko.corp.local

#### Certificates creation

cwsa-md-vcf0-ko.corp.local,cwsa1-md-vcf0-ko.corp.local,cwsa2-md-vcf0-ko.corp.local,cwsa3-md-vcf0-ko.corp.local

10.210.17.3,10.210.17.4,10.210.17.5,10.210.17.6


vrops-md-vcf0-ko.corp.local,vrops1-md-vcf0-ko.corp.local,vrops2-md-vcf0-ko.corp.local,vrops3-md-vcf0-ko.corp.local
10.210.17.8,10.210.17.9,10.210.17.10,10.210.17.11

## Load Balancing Configuration

### vROPS

- https://docs.vmware.com/en/VMware-Aria-Operations/8.12/Load-Balancing-Operations/GUID-DD991FA2-74C5-494D-A72F-95167BAAA538.html

### Aria Automation

- https://docs.vmware.com/en/VMware-Aria-Automation/8.12/load-balancing/GUID-9A65ED0E-E871-44FD-A915-CC107C7AD6B1.html

