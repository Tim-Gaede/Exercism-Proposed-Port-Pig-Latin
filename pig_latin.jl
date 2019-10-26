def translate(text):
    words = text.split(" ")
    result = ""
    for i in range(0, len(words)-1):

        result += convert(words[i])
        result += ' '

    result += convert(words[len(words) - 1])
    return result

def convert(word):
    vowels = ['a', 'e', 'i', 'o', 'u']
    if len(word) <= 1:
        raise ValueError("word must be at least two characters")


    if (word[0] in vowels) or (word[0:2] in ["xr", "yt"]):
        return word + "ay"

    if (word[0] not in vowels) and (word[1] in vowels):
        return word[1:] + word[0] + "ay"

    if (word[0:2] == "qu") and (len(word) >= 3):
        return word[2:] + "quay"

    if (word[0] not in vowels) and \
            (word[1] not in vowels) and \
            (len(word) >= 3 and word[2] in vowels):
        return word[2:] + word[0:2] + "ay"

    if (word[0] not in vowels) and \
            (word[1] not in vowels) and \
            (len(word) >= 4 and word[2] not in vowels) and \
            (len(word) >= 4 and word[3] in vowels):
        return word[3:] + word[0:3] + "ay"

    if (word[0] not in vowels) and \
            (len(word) >= 3) and \
            (word[2:4] == "qu"):
        return word[3:] + word[0:3] + "ay"

    if (word[0] not in vowels) and \
            (word[1] == 'y'):
        return 'y' + word[1:] + "ay"

    if (word[0] not in vowels) and \
            (word[1] not in vowels) and \
            (len(word) >= 3 and word[2] == 'y'):
        return 'y' + word[2:] + "ay"
