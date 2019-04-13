URL='http://localhost:3000/api/v1/slack/event'
JSON='{"token":"Jhj5dZrVaK7ZwHHjRyZWjbDl","challenge":"3eZbrw1aBm2rZgRNFdxV2595E9CY3gmdALWMmHkvFXO7tYXAYM8P","type":"url_verification"}'
curl -X POST -H 'Content-Type:application/json' -d ${JSON} ${URL}

