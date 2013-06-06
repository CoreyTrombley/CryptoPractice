# Crypto Practice

Lets have fun cracking some classic ciphers.

# TODO

* Fork and clone as per usual
* cd into ~/projects/CryptoPractice
* Find some English text somewhere on the web, at least 100 words will do. Place in a file called message.txt in the project directory
* Encrypt it using a Caesar cipher with ```ruby encryptor.rb caesar message.txt```
* Send your encrypted text to a classmate. Swap with their encrypted message and write a program that deciphers it.
* Do the same thing with a substitution Cipher. Perform a frequency analysis on the encrypted text using ```ruby cracker.rb encrypted.txt```
* Update the cracker.rb file to add guesses to the hash, so that you are mapping the encrypted text back into plaintext.
* Write a cipher that can encrypt / decrypt using the http://en.wikipedia.org/wiki/Vigen%C3%A8re_cipher