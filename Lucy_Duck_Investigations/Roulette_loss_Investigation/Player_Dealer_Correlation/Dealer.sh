cat 0310_Dealer_schedule 0312_Dealer_schedule | grep -e "05:00:00 AM" -e "08:00:00 AM" -e "02:00:00 PM" -e "08:00:00 PM" -e "11:00:00 PM" | awk -F" " '{print $1, $2, $5, $6}' > Dealers_working_during_losses
cat 0315_Dealer_schedule | grep -e "05:00:00 AM" -e "08:00:00 AM" -e "02:00:00 PM" | awk -F" " '{print $1, $2, $5, $6}' >> Dealers_working_during_losses 
cat Dealers_working_during_losses | wc -l >> Dealers_working_during_losses
