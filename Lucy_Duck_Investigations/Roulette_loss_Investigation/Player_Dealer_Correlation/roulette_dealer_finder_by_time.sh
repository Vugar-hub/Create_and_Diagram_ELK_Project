
echo "Enter the date(ddMM): "
read date
echo "Enter the time(hh:mm:ss AM/PM): "
read time
cat "$date"_Dealer_schedule |grep "$time"| awk -F" " '{print $1, $2, $5, $6}'

