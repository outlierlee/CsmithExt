#!/bin/bash

CC1='current-gcc -w -O0'
CC2='current-gcc -w -O2'

rm -f out*.txt

echo here1 &&\
current-gcc -Wall -O small.c  >outa.txt 2>&1 &&\
! grep uninitialized outa.txt &&\
! grep 'control reaches end' outa.txt &&\
clang -Wall -O0 -c small.c  >out.txt 2>&1 &&\
! grep 'end of non-void function' out.txt &&\
! grep 'invalid in C99' out.txt &&\
! grep 'should return a value' out.txt &&\
! grep uninitialized out.txt &&\
! grep 'incompatible pointer' out.txt &&\
! grep 'type specifier missing' out.txt &&\
echo here2 &&\
$CC1 small.c -o small1 > cc_out1.txt 2>&1 &&\
RunSafely.sh 3 1 /dev/null out1.txt ./small1 >/dev/null 2>&1 &&\
$CC2 small.c -o small2 > cc_out2.txt 2>&1 &&\
RunSafely.sh 3 1 /dev/null out2.txt ./small2 >/dev/null 2>&1 &&\
! diff out1.txt out2.txt &&\
echo here3 &&\
~/c-semantics-bundle-0.1/c-semantics/dist/kcc -s small.c >/dev/null 2>&1 &&\
echo here4 &&\
./a.out &&\
echo here5