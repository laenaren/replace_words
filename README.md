# replace_words
A home assignment for TMNL

# introduction
This is a POC version
 For the real deployment I would set it in a container on ECS or EKS if needed
 For Secuiry I would Use AWS Cognito or Okta to ristrict users access and even close the ALB behind AWS WAF to add more swcueiry.

 There is also a draft of thr terraform file that I haven't tested and should be refactored into modules but I didnt have enough time and also that was not a part of the assigment.


Example usage: 
`curl -X POST http://tmnl-1207112598.eu-west-1.elb.amazonaws.com -H "Content-Type: application/json" -d '{"text": "The analysts of trioDOs did a great job!"}' `

Exected output
{"original": "The analysts of trioDOs did a great job!", "processed": "The analysts of Triodos Bank did a great job!"}


 Thank you :)
