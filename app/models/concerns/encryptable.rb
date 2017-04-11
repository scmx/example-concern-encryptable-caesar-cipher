# frozen_string_literal: true

# Concern for encrypting fields
module Encryptable
  extend ActiveSupport::Concern

  # Public class methods to expose
  module ClassMethods
    def encryptable(*attributes, cipher: CaesarCipher.new)
      attributes.each { |attr| encrypt(attr, "#{attr}_encrypted", cipher) }
    end

    def encrypt(attr, field, cipher)
      define_method attr do
        value = public_send(field)
        cipher.decrypt(value) if value
      end

      define_method "#{attr}=" do |value|
        value = cipher.encrypt(value) if value
        public_send("#{field}=", value)
      end
    end
  end
end
