require 'pry'

class String

  def encrypt(algorithm = :ceasar)
    self.send("encrypt_#{algorithm}")
  end

  def encrypt_ceasar
    cipher = alphabet.rotate(rand(24) + 1)
    substitution = Hash[alphabet.zip(cipher)]
    self.map_to(substitution)
  end

  def encrypt_substitution
    cipher = alphabet.shuffle
    substitution = Hash[alphabet.zip(cipher)]
    self.map_to(substitution)
  end

  def map_to(map)
    length.times do |i|
      self[i] = map[self[i]] || self[i]
    end
    self
  end

  def alphabet
    @alphabet ||= ('a'..'z').to_a
  end

end

if ARGV.length == 2
  begin
    output_file = "encrypted.txt"
    puts "Encrypted #{ARGV[1]} using the #{ARGV[0]} cipher to file #{output_file}"
    message = File.open(ARGV[1]).read.strip.chomp.downcase
    File.open(output_file, "w") { |f| f.write message.encrypt(ARGV[0]) }
  rescue
    puts "Could not open #{ARGV[0]}"
  end
else
  puts "Usage: ruby substitution.rb <cipher: ceasar|substitution> <message_file.txt>"
end
