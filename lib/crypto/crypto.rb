module Crypto
  def alphabet
    @alphabet ||= ('a'..'z').to_a
  end

  module Ciphers
   def encrypt_ceasar(plain_text)
      cipher = alphabet.rotate(rand(24) + 1)
      substitution = Hash[alphabet.zip(cipher)]
      plain_text.map_to(substitution)
    end

    def encrypt_substitution(plain_text)
      cipher = alphabet.shuffle
      substitution = Hash[alphabet.zip(cipher)]
      plain_text.map_to(substitution)
    end
  end

  module Cracking
    def entropy
      puts "=== Entropy report: ==="
      puts "Single letter words : #{single_letter_words(@cipher_text).join(', ')}"
      puts "Letter frequency: #{letter_frequency(@cipher_text)}"
    end

    def single_letter_words(cipher_text)
      return cipher_text.squeeze.split(" ").select { |word| word.length == 1 }
    end

    def letter_frequency(cipher_text)
      count = alphabet.map {|letter| cipher_text.chars.to_a.count(letter) }
      frequency = Hash[alphabet.zip(count)]
    end
  end
end

class String
  def map_to(map)
    length.times do |i|
      self[i] = map[self[i]] || self[i].upcase
    end
    self
  end
end