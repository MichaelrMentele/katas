class Atbash
  # implement an atbash cipher that can encode strings into atbash
  ALPHABET = ('a'..'z').to_a
  NUMBERS = ('1'..'9').to_a

  REVERSE_ALPHABET = ALPHABET.clone.reverse!

  CIPHER_MAP = {}
  ALPHABET.each_with_index do |letter, index|
    CIPHER_MAP[letter] = REVERSE_ALPHABET[index]
  end
  # numbers don't get encoded to anything new in our scheme
  NUMBERS.each do |num|
    CIPHER_MAP[num] = num
  end

  def self.encode(message)
    formatted_msg = pre_format(message)
    ciphered_msg = cipher(formatted_msg)
    format_cipher(ciphered_msg)
  end

  protected 

  def self.pre_format(message)
    message = message.downcase
    strip_invalid_chars(message)
  end

  def self.strip_invalid_chars(message)
    message = message.delete(' ')
    message = message.split('')

    new_message = []
    message.each do |letter|
      if ALPHABET.include?(letter) || NUMBERS.include?(letter)
        new_message.push(letter)
      end
    end

    new_message.join('')
  end

  def self.cipher(message)
    ciphered = ''
    message.split('').each do |letter|
      ciphered += CIPHER_MAP[letter]
    end
    ciphered
  end

  def self.format_cipher(message)
    message.scan(/.{1,5}/).join(' ')
  end
end
