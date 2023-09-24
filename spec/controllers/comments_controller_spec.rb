require 'rails_helper'

RSpec.describe CommentsController  do
  describe "POST create" do
    #let(:post){create :post}
    let!(:topic) {Topic.new(id:5)}
    let!(:post) {create :post,topic_id: 5}
    it "should accepts the params with html format" do
      #post :create, params: { comment:{ text: 'Hello'} ,"post_id"=>"5"}
      post :create, params: {"authenticity_token"=>"[FILTERED]", "comment"=>{"text"=>"fav"}, "commit"=>"Create Comment", "post_id"=>"5"}
      #debugger
      expect(response.media_type).to eq('text/html')
      expect(response.content_type).to eq("text/html; charset=utf-8")
    end

  end
end