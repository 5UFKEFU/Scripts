#!/bin/bash
i=1
while [ $i -le  1000000 ]
do
echo $i@gmail.com  >> email.csv
let i=$i+1

done
