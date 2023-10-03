# replace_words
A home assignment for TMNL

# introduction
This is a POC version
 For the real deployment I would set it in a container on ECS or EKS if needed and replace the alb vuth Api Gateway
 For Secuiry I would Use AWS Cognito or Okta to restrict users access and even close the ALB/APiGW behind AWS WAF to add more security.

# Instractions
Example usage: 
`curl -X POST http://tmnl-1207112598.eu-west-1.elb.amazonaws.com -H "Content-Type: application/json" -d '{"text": "The analysts of trioDOs did a great job!"}' `

Exected output
{"original": "The analysts of trioDOs did a great job!", "processed": "The analysts of Triodos Bank did a great job!"}


 Thank you :)
