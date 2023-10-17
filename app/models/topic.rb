class Topic < ApplicationRecord
  has_many :posts ,dependent: :destroy
  validates :title,presence: true


  paginates_per 10

end
