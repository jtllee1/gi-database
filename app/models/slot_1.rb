class Slot1 < ApplicationRecord
  has_one :character
  belongs_to :team
end
