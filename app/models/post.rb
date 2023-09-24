class Post < ApplicationRecord

  paginates_per 2

  validates :topic_id, :title,presence: true
  #validate -->for custom validation
  before_save :check_description

  belongs_to :topic

  has_many :comments,dependent: :destroy
  has_many :post_tags
  has_many :tags,through: :post_tags

  accepts_nested_attributes_for :tags

  def check_description
    self.description = "demo" if description.nil?
  end

end