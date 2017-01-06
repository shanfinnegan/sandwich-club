class Sandwich < ApplicationRecord
  has_many :eater_sandwiches
  has_many :eaters, through: :eater_sandwiches
  has_many :comments
  validates :ingredients, :eaters, :tasting_notes, presence: true
  accepts_nested_attributes_for :eaters

  def show_date
    self.date.strftime("%A, %B %e, %Y")
  end

end
