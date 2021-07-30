class Slot3 < ApplicationRecord
  has_one :character
  belongs_to :team
end
