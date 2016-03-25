require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:post) { FactoryGirl.create(:post) }
  let(:user) { FactoryGirl.create(:user) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      sign_in
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      sign_in
      post
      get :show, FactoryGirl.attributes_for(:post)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      post
      user
      user = User.find_by(id: 1)
      sign_in(user)
      get :edit, FactoryGirl.attributes_for(:post)
      expect(response).to have_http_status(:success)
    end
  end

end
