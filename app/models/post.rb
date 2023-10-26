class Post < ApplicationRecord
  validates :title, length: {maximum: 20}
  validates :topic_id, :title,presence: true
  #validate -->for custom validation

  before_save :check_description

  belongs_to :topic
  belongs_to :user

  has_many :comments,dependent: :destroy
  has_many :post_tags
  has_many :tags,through: :post_tags

  has_and_belongs_to_many :users, join_table: "posts_users_read_status"

  has_many :ratings ,dependent: :destroy

  accepts_nested_attributes_for :tags, allow_destroy: true
  accepts_nested_attributes_for :ratings

  has_one_attached :image ,dependent: :destroy

  def check_description
    self.description = "demo" if description.nil?
  end

  scope :listed, ->(from,to) {

   where("created_at >= ? AND created_at <= ? ", from,to.to_date + 1.day) }

end