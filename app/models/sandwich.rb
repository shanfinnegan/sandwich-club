class Sandwich < ApplicationRecord
  has_many :eater_sandwiches
  has_many :eaters, through: :eater_sandwiches
  has_many :comments

  def show_date
    self.date.strftime("%A, %B %e, %Y")
  end
  
end
