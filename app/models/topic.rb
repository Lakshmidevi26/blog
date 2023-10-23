class Topic < ApplicationRecord
  has_many :posts ,dependent: :destroy
  validates :title,presence: true

  before_create do
    puts "going to create topic  yes"
    puts "lets go"
  end
  paginates_per 10

end
