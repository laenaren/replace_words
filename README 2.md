-- usage --

-- To Test --
To test the payload of the lambda funtion"
curl -X POST https://<lambda-function-invoke-url>/replace_words -H "Content-Type: application/json" -d '{
  "text": "The analysts of ABN did a great job!",
  "replacements": {
  "ABN": "ABN AMRO"
  }
}'