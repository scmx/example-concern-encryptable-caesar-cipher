# frozen_string_literal: true

# Provides ROT3 "encryption", also known as caesar cipher
class CaesarCipher
  def encrypt(string)
    string.split('').map { |char| shift(char, -3) }.join
  end

  def decrypt(string)
    string.split('').map { |char| shift(char, 3) }.join
  end

  private

  def shift(char, amount)
    chars = characters
    chars = chars.map(&:upcase) if char.upcase == char
    index = chars.find_index(char)
    return char unless index
    new_index = (index + amount) % size
    chars[new_index]
  end

  def characters
    ('a'..'z').to_a
  end

  def size
    characters.size
  end
end
