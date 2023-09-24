require 'rails_helper'

RSpec.describe Comment, type: :model do

  context  "When delete a post" do

    let!(:topic1) {Topic.create(id: 10)}
    let!(:post) {create :post,topic_id: 10}
    let!(:comment) {create :comment}
    it "delete all the related posts " do
      expect(post.comments.count).to eq(1)
      post.destroy
      expect(post.comments.count).to eq(0)

    end
  end

end
