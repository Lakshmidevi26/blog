require 'rails_helper'

RSpec.describe Post, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  context "when creating a post " do
    let(:post) { build :post }
    #post = Post.new(title:"lan",description:"lan",topic_id: 5)
    #topic = Topic.create(id: 5)  # when use association,make sure required necessary associated table row
                                  # And once you run it the make this line sa comment line. Because again it will try to create topic with same id
                                  # To avoid it use let
    let(:topic) {Topic.new(id:5)}
    it "should be valid user with all attributes " do
      #expect(post).to be_valid
      #post.valid? == true                            --> it also return false
      #post.errors.full_messages
      #post.valid?.should == true                      --> it raise warning so use next line
      expect(post.valid?).to eq(true)
    end


    let(:post2) { create :post,description:nil }
    it 'should have description :demo if description = nil' do
      #debugger  --> use hold the process for debugging
      expect(post2.description).to eq('demo')
    end

    let(:post3) { build :post,topic_id:nil}
    it "raise error when topic_id is nil " do
      expect(post3.save).to eq(false)
      expect{post3.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
  context  "When delete a topic" do

    let!(:topic1) {Topic.create(id: 10)}
    let!(:post4) {create :post,topic_id: 10}
    let!(:post5) {create :post,topic_id: 10}
    it "delete all the related posts " do
      expect(topic1.posts.count).to eq(2)
      topic1.destroy
      expect(topic1.posts.count).to eq(0)

    end
  end
end
