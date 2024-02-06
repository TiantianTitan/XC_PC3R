#!/bin/sh

cat $1 | awk 'BEGIN { aff=0 }  /end result \*/ { aff=0 } { if(aff==1) { print $0 }} /\/\* result/ { aff=1 }'