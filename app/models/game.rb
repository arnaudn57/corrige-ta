class Game < ApplicationRecord
  belongs_to :user
  belongs_to :computer_persona
  belongs_to :user_persona
  belongs_to :persona
  has_many :rounds
end
