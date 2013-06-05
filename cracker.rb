require './lib/crypto/crypto'

class Cracker
  include Crypto
  include Crypto::Cracking

  def read_file(file)
    @cipher_text = File.open(file).read
  end

  def decrypt(guess = {})
    @cipher_text.map_to(guess)
  end

  def usage
    puts "ruby cracker.rb <encrypted.txt>"
  end
end

c = Cracker.new

if ARGV.length == 1
  c.read_file ARGV[0]
  c.entropy
  # TODO - Update this hash with your guesses to decode the alphabet
  c.decrypt({})
else
  c.usage
end