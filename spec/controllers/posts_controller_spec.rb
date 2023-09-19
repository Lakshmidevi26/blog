require 'rails_helper'

RSpec.describe PostsController  do
  describe 'GET index' do
    let(:post){create :post}
    let(:post2){create :post}

    before(:each) do
      get :index
    end

    it "assigns @users" do
      expect(assigns(:posts)).to eq([post])
    end
    it "renders the index template" do
      expect(response).to render_template("index")
    end
    it "return status ok 200" do
      expect(response).to have_http_status(200)
      expect(response).to have_http_status(:ok)
      #expect(response.body).to match(/test link text/)
    end

  end

  describe "POST create" do
    #let(:post){create :post}

     it "should accepts the params with html format" do
       post :create, params: { post:{ title: 'Hello', description: 'World', topic_id: 5 } }
       #debugger
         expect(response.media_type).to eq('text/html')
         expect(response.content_type).to eq("text/html; charset=utf-8")
     end

  end
end