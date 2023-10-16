class Topic < ApplicationRecord
  has_many :posts ,dependent: :destroy
  validates :title,presence: true
  validate :mine

  paginates_per 10

  def mine
      if Topic.count >=10
        errors.add(:topic," entry can't be topic more than 10")
      end  
  end  
  
end
