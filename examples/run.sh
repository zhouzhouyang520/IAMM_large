#!/bin/sh

#source /etc/network_turbo
#source activate py310_chat

out=out.log
#nohup sh ed.sh 0 > $out 2>&1 &
#nohup sh ed_keyword_nolowLimit.sh 0 > $out 2>&1 &
nohup sh ./ed.sh 0 > $out 2>&1 &
#out=out_test2.log
#nohup sh ed.sh 0 > $out 2>&1 &

tail -f $out
