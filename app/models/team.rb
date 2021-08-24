class Team < ApplicationRecord
  belongs_to :slot_a
  belongs_to :slot_b
  belongs_to :slot_c
  belongs_to :slot_d
end
