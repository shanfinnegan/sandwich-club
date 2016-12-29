class Eater < ApplicationRecord
  has_many :eater_sandwiches
  has_many :sandwiches, through: :eater_sandwiches
  has_many :comments
end
