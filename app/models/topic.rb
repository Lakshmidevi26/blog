class Topic < ApplicationRecord
  has_many :posts ,dependent: :destroy

  paginates_per 10
end
