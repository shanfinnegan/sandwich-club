class Comment < ApplicationRecord
  belongs_to :eater
  belongs_to :sandwich
end
