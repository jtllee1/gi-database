class SlotB < ApplicationRecord
  belongs_to :character
  has_one :team
end
