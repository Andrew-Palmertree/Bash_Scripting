## Andrew Palmertree
## Description: Grabs the local weather based on the current location with the IP address

#!/bin/bash

# OpenWeatherMap API key
# You will need to add your OpenWeatherMap AP. I hid mine.
API_KEY="################################"

# Get the public IP's geographical location using ipinfo.io
location=$(curl -s https://ipinfo.io/ | jq -r '.loc')
latitude=$(echo $location | cut -d',' -f1)
longitude=$(echo $location | cut -d',' -f2)

# Grabs the weather data using the OpenWeatherMap API and the location from ipinfo.io
weather_data=$(curl -s "http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$API_KEY&units=imperial")

# Parse the JSON data using jq command (jason query)
temperature=$(echo $weather_data | jq -r '.main.temp')
description=$(echo $weather_data | jq -r '.weather[0].description')
city=$(echo $weather_data | jq -r '.name')

# Display the weather information from the APIs
echo "Current weather in $city:"
echo "Temperature: $temperature°C"
echo "Description: $description"