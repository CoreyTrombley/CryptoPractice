require 'pry'

class String

  def encrypt(algorithm = :substitution)
    self.send("encrypt_#{algorithm}")
  end

  def decrypt(algorithm = :substitution)
    self.send("decrypt_#{algorithm}")
  end

  def encrypt_substitution
    alphabet = ('a'..'z').to_a
    cipher = alphabet.shuffle
    substitution = Hash[alphabet.zip(cipher)]

    self.chars.to_a.uniq.each do |c|
      self.gsub!(c, substitution[c] || c)
    end

    self
  end

end

puts "Ruby String Encryptor - Please enter your message"
message = gets.strip.chomp.downcase
puts message.encrypt