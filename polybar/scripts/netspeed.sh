LINE=`grep $1 /proc/net/dev | sed s/.*://`;
RECEIVED1=`echo $LINE | awk '{print $1}'`
TRANSMITTED1=`echo $LINE | awk '{print $9}'`
TOTAL=$(($RECEIVED1+$TRANSMITTED1))

sleep $SLP

LINE=`grep $1 /proc/net/dev | sed s/.*://`;
RECEIVED2=`echo $LINE | awk '{print $1}'`
TRANSMITTED2=`echo $LINE | awk '{print $9}'`
SPEED=$((($RECEIVED2+$TRANSMITTED2-$TOTAL)/$SLP))
INSPEED=$((($RECEIVED2-$RECEIVED1)/$SLP))
OUTSPEED=$((($TRANSMITTED2-$TRANSMITTED1)/$SLP))

printf "In: %12i KB/s | Out: %12i KB/s | Total: %12i KB/s\n" $(($INSPEED/1024)) $(($OUTSPEED/1024)) $((($INSPEED+$OUTSPEED)/1024)) ;

