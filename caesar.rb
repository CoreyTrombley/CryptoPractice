require "pry"
@cipher_text = File.open("encrypted.txt").read
key = 0

letters = @cipher_text.chars.to_a

alphabet = ("a".."z").to_a

# rotated_alphabet = alphabet.rotate(key)

# p = rotated_alphabet.index(letters[0])

# puts alphabet[p - key]
plain_text = ""


while key < 25 do
  key += 1
  plain_text = ""
  letters.each do |letter|
    rotated_alphabet = alphabet.rotate(key)
    p = rotated_alphabet.index(letter)
    if p != nil
      plain_text << alphabet[p - key]
      # puts alphabet[p - key]
    else
      plain_text << letter
      # puts letter
    end
  end
  puts ""
  puts "#{key} ===== #{plain_text}"
  puts ""
  
end