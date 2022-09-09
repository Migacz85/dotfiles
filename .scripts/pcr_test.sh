# ballaly=$(curl -m 10 'https://covid19test.healthservice.ie/swiftflow.php?future_days=1&minutes_buffer=60&enforce_future_days=1&enforce_today_or_tomorrow_only=0' - H 'authority: covid19test.healthservice.ie' - H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96"' - H 'accept: application/json, text/plain, */*' - H 'dnt: 1' - H 'content-type: application/json' - H 'sec-ch-ua-mobile: ?0' - H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36' - H 'sec-ch-ua-platform: "Linux"' - H 'origin: https://covid19test.healthservice.ie' - H 'sec-fetch-site: same-origin' - H 'sec-fetch-mode: cors' - H 'sec-fetch-dest: empty' - H 'referer: https://covid19test.healthservice.ie/hse-self-referral/facilities/' - H 'accept-language: en-IE,en;q=0.9,pl-PL;q=0.8,pl;q=0.7,en-US;q=0.6'--data - raw '{"task":"getConsultantAvailability","facility_id":"$2y$10$YwDZ7owcI/RPJTiNyjPvmOR3nzy.57NxGPJBzemTabHDhfLus.2s2","type_id":14924,"flow":"routine"}'--compressed  | jq '.data.type.total_slots_available' )
# echo $ballaly 
#   if [[ $ballaly -gt 0 ]] 
#   then
#       echo "Free slots greater than 0."
# else 
#     echo "no free slots"
# fi

# js=$(curl 'https://covid19test.healthservice.ie/swiftflow.php?future_days=1&minutes_buffer=60&enforce_future_days=1&enforce_today_or_tomorrow_only=0' \
#   -H 'authority: covid19test.healthservice.ie' \
#   -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96"' \
#   -H 'accept: application/json, text/plain, */*' \
#   -H 'dnt: 1' \
#   -H 'content-type: application/json' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36' \
#   -H 'sec-ch-ua-platform: "Linux"' \
#   -H 'origin: https://covid19test.healthservice.ie' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'referer: https://covid19test.healthservice.ie/hse-self-referral/facilities/' \
#   -H 'accept-language: en-IE,en;q=0.9,pl-PL;q=0.8,pl;q=0.7,en-US;q=0.6' \
#   --data-raw '{"task":"getConsultantAvailability","facility_id":"$2y$10$YwDZ7owcI/RPJTiNyjPvmOR3nzy.57NxGPJBzemTabHDhfLus.2s2","type_id":14924,"flow":"routine"}' \
#   --compressed  \
#   -w 10 | jq '.data.type.total_slots_available' )
# echo $js 
# free_slots=$(echo $js | jq '.data.type.total_slots_available')
# echo "free slots number: $free_slots"
# if [[ $free_slots -gt 0 ]]; then   
#     echo "Free slots greater than 0." && mpv hospital.mp3 ; 
# else echo "no free slots"; 
# fi


curl -m 10 'https://covid19test.healthservice.ie/swiftflow.php?future_days=1&minutes_buffer=60&enforce_future_days=1&enforce_today_or_tomorrow_only=0'   -H 'authority: covid19test.healthservice.ie'   -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96"'   -H 'accept: application/json, text/plain, */*'   -H 'dnt: 1'   -H 'content-type: application/json'   -H 'sec-ch-ua-mobile: ?0'   -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36'   -H 'sec-ch-ua-platform: "Linux"'   -H 'origin: https://covid19test.healthservice.ie'   -H 'sec-fetch-site: same-origin'   -H 'sec-fetch-mode: cors'   -H 'sec-fetch-dest: empty'   -H 'referer: https://covid19test.healthservice.ie/hse-self-referral/facilities/'   -H 'accept-language: en-IE,en;q=0.9,pl-PL;q=0.8,pl;q=0.7,en-US;q=0.6'   --data-raw '{"task":"getConsultantAvailability","facility_id":"$2y$10$YwDZ7owcI/RPJTiNyjPvmOR3nzy.57NxGPJBzemTabHDhfLus.2s2","type_id":14924,"flow":"routine"}'   --compressed | jq '.data.type.total_slots_available' > pcr.test && if [[ $(<pcr.test) -gt 0 ]]; then   echo "Ballaly - Free slots greater than 0." && mpv --length=3 hospital.mp3 ; else echo "Balally- no free slots"; fi

curl -m 10 'https://covid19test.healthservice.ie/swiftflow.php?future_days=1&minutes_buffer=60&enforce_future_days=1&enforce_today_or_tomorrow_only=0'   -H 'authority: covid19test.healthservice.ie'   -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="96"'   -H 'accept: application/json, text/plain, */*'   -H 'dnt: 1'   -H 'content-type: application/json'   -H 'sec-ch-ua-mobile: ?0'   -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36'   -H 'sec-ch-ua-platform: "Linux"'   -H 'origin: https://covid19test.healthservice.ie'   -H 'sec-fetch-site: same-origin'   -H 'sec-fetch-mode: cors'   -H 'sec-fetch-dest: empty'   -H 'referer: https://covid19test.healthservice.ie/hse-self-referral/facilities/'   -H 'accept-language: en-IE,en;q=0.9,pl-PL;q=0.8,pl;q=0.7,en-US;q=0.6'   --data-raw '{"task":"getConsultantAvailability","facility_id":"$2y$10$GevQM757ZpxFdlRqKBv/B.bRJ26LVoUCEYthhJpDojNLvsJj22Wq1","type_id":16722,"flow":"routine"}'   --compressed |      jq '.data.type.total_slots_available' > pcr.test && if [[ $(<pcr.test) -gt 0 ]]; then   echo "Explorium - Free slots greater than 0." && mpv --length=3 hospital.mp3 ; else echo "Explorium - no free slots"; fi



