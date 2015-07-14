# pi-utils
Utility bash scripts created to learn and mess about with on the raspberry pi.

## Setup
Copy appropriate device udev rules files from `pi-garmin-upload/udev-rules` (or create your own with a new product ID) into:
```
/etc/udev/rules.d/
```
And then reload the udev rules with:
```
$ sudo udevadm control --reload-rules
```
