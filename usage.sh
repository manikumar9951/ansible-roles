#!/bin/bash
#echo `date`
#cpu use threshold
cpu_threshold='80'
 #mem idle threshold
mem_threshold='100'
 #disk use threshold
disk_threshold='70'
#---cpu
cpu_usage () {
cpu_idle=`top -b -n 1 | grep Cpu | awk '{print $8}'|cut -f 1 -d "."`
cpu_use=`expr 100 - $cpu_idle`
 echo "Cpu Utilization: $cpu_use %"
if [ $cpu_use -gt $cpu_threshold ]
    then
        echo "Cpu Staus: Warning!"
        SUBJECT="ATTENTION: CPU load is high"
        MESSAGE="CPU load is high, please check"
        TO="example@gmail.com"
    else
        echo "Cpu Status: Ok"
fi
}
#---mem
mem_usage () {
 #MB units
mem_free=`free -m | grep "Mem" | awk '{print $4+$6}'`
 echo "Memory Space Semaining : $mem_free MB"
if [ $mem_free -lt $mem_threshold  ]
    then
        echo "Memory status: Warning!"
        SUBJECT="ATTENTION: memory is low"
        MESSAGE="Memory is low, please check"
        TO="example@gmail.com"
    else
        echo "Memory Staus: Ok"
fi
}
#---disk
disk_usage () {
disk_use=`df -P | grep /dev | grep -v -E '(tmp|boot)' | awk '{print $5}' | cut -f 1 -d "%"`
 echo "Disk Usage : $disk_use %"
if [ $disk_use -gt $disk_threshold ]
    then
        echo "Status of Disk Usage : Disk space warning!"
        SUBJECT="ATTENTION: disk space is low"
        MESSAGE="disk space is low, please check"
        TO="example@gmail.com"
    else
        echo "Status of Disk Usage: Ok"
fi


}
cpu_usage
mem_usage
disk_usage