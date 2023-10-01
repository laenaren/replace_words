#import re

def replace_words(text, replacements):
  """Replaces certain words in a string with other words.

  Args:
    text: A string.
    replacements: A dictionary mapping words to their replacements.

  Returns:
    A string with the words replaced.
  """

  for word, replacement in replacements.items():
   #text = re.sub(r"\b{}\b".format(word), replacement, text)
    text = text.replace(word, replacement)

  
  return text



replacements = {
    "ABN": "ABN AMRO",
    "ING": "ING Bank",
    "Rabo": "Rabobank",
    "Triodos": "Triodos Bank",
    "Volksbank": "de Volksbank",
}

text = "The analysts of ABN did a great job!"
replaced_text = replace_words(text, replacements)
print(replaced_text)
