# frozen_string_literal: true

# Users of the system
class User < ApplicationRecord
  include Encryptable
  encryptable :name
end
