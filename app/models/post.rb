class Post < ApplicationRecord
  validates :topic_id, :title,presence: true
  #validate -->for custom validation
  before_save :check_description
  belongs_to :topic

  def check_description
    self.description = "demo" if description.nil?
  end

end