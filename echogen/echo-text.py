import markovify

INPUT_FILE = "media/2-prepared/text/tweets.txt"
OUTPUT_FILE = "media/3-echoes/text/tweets.txt"

with open(INPUT_FILE) as f:
    file_text = f.read()

text_model = markovify.NewlineText(file_text, well_formed=False)

with open(OUTPUT_FILE, 'w') as output:
    for i in range(1000):
        output.write(text_model.make_short_sentence(200) + ("\n" if i <= 998 else ""))