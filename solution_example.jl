 function translate(text::String)
    words = String[]
    text_split = split(text, ' ')
    for item in text_split;    push!(words, item);    end

    result = ""

    # translate all but last word && add space
    for i = 1: length(words) - 1
        result *= converted(words[i])
        result *= ' '
    end

    result *= converted(last(words))


    result
end

function converted(word::String)
    len = length(word)
    if len ≤ 1
        throw(ArgumentError("word must be at least two characters"))
    end

    vowels = ['a', 'e', 'i', 'o', 'u']

    # Starts with vowel or vowel sound.
    # Add an "ay".
    if word[1] ∈ vowels  ||  word[1:2] ∈ ["xr", "yt"]
        return word * "ay"
    end

    # Begins with a consanant sound but not followed by a "qu".
    # move it to the end of the word and then add an "ay".
    if word[1] ∉ vowels  &&  word[2] ∈ vowels
        return word[2:end] * word[1] * "ay"
    end

    # Starts with a consonant sound followed by "qu".
    # move it to the end of the word and then add an "ay".
    if word[1:2] == "qu" &&  len ≥ 3
        return word[3:end] * "quay"
    end

    if word[1] ∉ vowels  &&  word[2] ∉ vowels &&
       len ≥ 3  &&  word[3] ∈ vowels

        return word[3:end] * word[1:2] * "ay"
    end


    if word[1] ∉ vowels  &&  word[2] ∉ vowels  &&
             len ≥ 4     &&  word[3] ∉ vowels  &&  word[4] ∈ vowels

        return word[4:end] * word[1:3] * "ay"
    end

    if word[1] ∉ vowels  &&  len ≥ 3  &&  word[3:4] == "qu"
        return word[4:end] * word[1:3] * "ay"
    end

    # A "y" after a starting consonant
    if word[1] ∉ vowels  &&  word[2] == 'y'
        return 'y' * word[2:end] * "ay"
    end

    # A "y" after a starting consonant cluster
    if word[1] ∉ vowels  &&  word[2] ∉ vowels  &&
           len ≥ 3       &&  word[3] == 'y'
        return 'y' * word[3:end] * "ay"
    end

end
