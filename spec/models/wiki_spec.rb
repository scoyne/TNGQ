require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:wiki) { Wiki.create!(title: "New Wiki", body: "This is the Wiki Body", private: false) }

  describe "attributes" do
    it "has title attribute" do
      expect(wiki).to have_attributes(title: "New Wiki")
    end

    it "has body attribute" do
      expect(wiki).to have_attributes(body: "This is the Wiki Body")
    end

    it "does not have private attribute" do
      exptec(wiki).to have_attributes(private: false)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @wiki" do
      get :new
      expect(assigns(:wiki)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of Wiki by 1" do
      expect{ post :create, params: { wiki: { title: RandomData.random_sentence, body: RandomData.random_paragraph } } }.to change(Post,:count).by(1)
    end

    it "assigns the new post to @post" do
      post :create, params: { post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
      expect(assigns(:post)).to eq Post.last
    end

    it "redirects to the new post" do
      post :create, params: { post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
      expect(response).to redirect_to Post.last
    end
  end

end
