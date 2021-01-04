#!/bin/sh

TOKEN="eede2aac49a4b420091a181c837a32f7609022dc"
CITY=""

API="https://api.waqi.info/feed"

if [ -n "$CITY" ]; then
    aqi=$(curl -sf "$API/$CITY/?token=$TOKEN")
else
    location=$(curl -sf "https://location.services.mozilla.com/v1/geolocate?key=geoclue")

    if [ -n "$location" ]; then
        location_lat="$(echo "$location" | jq '.location.lat')"
        location_lon="$(echo "$location" | jq '.location.lng')"

        aqi=$(curl -sf "$API/geo:$location_lat;$location_lon/?token=$TOKEN")
    fi
fi

if [ -n "$aqi" ]; then
    if [ "$(echo "$aqi" | jq -r '.status')" = "ok" ]; then
        aqi=$(echo "$aqi" | jq '.data.aqi')

        if [ "$aqi" -lt 50 ]; then
            echo " $aqi"
        elif [ "$aqi" -lt 100 ]; then
            echo "北 $aqi"
        elif [ "$aqi" -lt 150 ]; then
            echo "北 $aqi"
        elif [ "$aqi" -lt 200 ]; then
            echo " $aqi"
        elif [ "$aqi" -lt 300 ]; then
            echo " $aqi"
        else
            echo " $aqi"
        fi
    else
        echo "$aqi" | jq -r '.data'
    fi
fi
