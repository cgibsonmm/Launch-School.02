# Write a program that reads the content of a text file and then prints the
# longest sentence in the file based on number of words. Sentences may end with
# periods (.), exclamation points (!), or question marks (?). Any sequence of
# characters that are not spaces or sentence-ending characters should be
# treated as a word. You should also print the number of words in the
# longest sentence.

# 1. import file to var
# 2. Split sentences
# 3. find longest sentence
# 4. return sentence and length

def find_longest_sentence(file_to_parse)
  file = File.read(file_to_parse)
  longest_line = file.split(/[.?!]/).max_by { |sentence| sentence.split.size }
  longest_line = longest_line.strip
  sentence_length = longest_line.split(' ').length
  puts longest_line
  puts "*" * 20
  puts "this sentence has #{sentence_length} words."
end

find_longest_sentence('./Book.txt')
