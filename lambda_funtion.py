import json
import re
import logging


def lambda_handler(event, context):
  """
  Args:
    event: A JSON object containing the text and replacements to be used.
    context: A Lambda context object.

  Returns:
    A JSON object containing the replaced text.
  """
  print("Received event: " + json.dumps(event, indent=2))
  replacements = {
    "ABN": "ABN AMRO",
    "ING": "ING Bank",
    "Rabo": "Rabobank",
    "Triodos": "Triodos Bank",
    "Volksbank": "de Volksbank",
}
  payload = json.loads(event["body"])
  text = payload["text"]
  replaced_text = replace_words(text, replacements)

  return {
    'statusCode': 200,
    'multiValueHeaders': {
      'Content-Type': ['application/json']
    },
    'body': json.dumps({
      'original': text,
      'processed': replaced_text
    })
  }

def replace_words(text, replacements):
  """Replaces certain words in a string with other words.

  Args:
    text: A string.
    replacements: A dictionary mapping words to their replacements.

  Returns:
    A string with the words replaced.
  """

  for word, replacement in replacements.items():
    # Used reqex to be able to handle the different cases
    text = re.sub(r"\b{}\b".format(word), replacement, text, flags=re.IGNORECASE)
  
  return text