#!/bin/sh

set -e
rm -fr almalinux9-nestdaq
rm -f  almalinux9-nestdaq.sif
apptainer build --sandbox almalinux9-nestdaq almalinux9-nestdaq.def
