# OpenShift Local Observe

resolution:
crc stop to stop the vm
crc config set enable-cluster-monitoring true to enable monitoring (this requires more RAM for the VM)
finally start the vm again crc start

verify with crc config view


Too little memory (10.5GiB) allocated to the virtual machine to start the monitoring stack, 14GiB is the minimum!!
