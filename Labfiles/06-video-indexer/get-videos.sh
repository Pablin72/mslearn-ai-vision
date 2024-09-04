#!/bin/bash

# Variables
account_id="fc649d4b-6680-490f-b1b0-d5b0231446c6"
api_key="9253478b99c94a9b9b82c32acaaf6bfb"
location="trial"

# Get access token
token=$(curl -s -X GET "https://api.videoindexer.ai/auth/$location/Accounts/$account_id/AccessToken" \
-H "Ocp-Apim-Subscription-Key: $api_key")

# Print the token for debugging (without quotes)
echo "Access Token: $token"

# Remove quotes if present
token=$(echo $token | sed 's/"//g')

# List videos with URL-encoded token
curl -s -X GET "https://api.videoindexer.ai/$location/Accounts/$account_id/Videos?accessToken=$(echo $token | jq -sRr @uri)" \
| jq .