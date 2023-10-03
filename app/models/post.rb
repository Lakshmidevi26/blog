class Post < ApplicationRecord

  validates :topic_id, :title,presence: true
  #validate -->for custom validation

  before_save :check_description

  belongs_to :topic
  belongs_to :user

  has_many :comments,dependent: :destroy
  has_many :post_tags
  has_many :tags,through: :post_tags

  has_and_belongs_to_many :users

  has_many :ratings ,dependent: :destroy

  accepts_nested_attributes_for :tags
  accepts_nested_attributes_for :ratings

  has_one_attached :image ,dependent: :destroy

  def check_description
    self.description = "demo" if description.nil?
  end

end