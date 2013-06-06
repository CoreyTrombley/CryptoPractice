require './lib/crypto/crypto'

class Encryptor
  include Crypto
  include Crypto::Ciphers

  def read_file(plain_text_file)
    @plain_text = File.open(plain_text_file).read.strip.chomp.downcase
  end

  def encrypt(algorithm = :caesar)
    @encrypted = self.send("encrypt_#{algorithm}", @plain_text)
  end

  def write_encrypted(output_file = "encrypted.txt")
    File.open(output_file, "w") { |f| f.write @encrypted }
  end

  def usage
    puts "Usage: ruby encryptor.rb <cipher: caesar|substitution> <message_file.txt>"
  end
end

e = Encryptor.new

if ARGV.length == 2
  e.read_file ARGV[1]
  e.encrypt ARGV[0]
  e.write_encrypted
else
  e.usage
end