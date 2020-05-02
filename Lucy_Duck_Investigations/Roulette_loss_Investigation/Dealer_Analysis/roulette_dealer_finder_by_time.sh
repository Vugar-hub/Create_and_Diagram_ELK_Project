
echo "Enter the date(ddMM): "
read date
echo "Enter the time(hh:mm:ss AM/PM): "
read time
echo "Enter game name"
read game name
cat "$date"_Dealer_schedule | grep "$time" | "$game name" = roulette then | awk -F" " '{print $1, $2, $5, $6}'
cat "$date"_Dealer_schedule | grep "$time" | "$game name" = blackjak then | awk -F" " '{print $1, $2, $3, $4}'
cat "$date"_Dealer_schedule | grep "$time" | "$game name" = texas then | awk -F" " '{print $1, $2, $7, $8}'
