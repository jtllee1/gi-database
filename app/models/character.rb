class Character < ApplicationRecord
  has_many :slot_a
  has_many :slot_b
  has_many :slot_c
  has_many :slot_d
end
