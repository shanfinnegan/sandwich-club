class Comment < ApplicationRecord
  belongs_to :eater, optional: true
  belongs_to :sandwich
  accepts_nested_attributes_for :eater
end
