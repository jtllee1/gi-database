class Team < ApplicationRecord
  has_one :slot_a
  has_one :slot_b
  has_one :slot_c
  has_one :slot_d
end
