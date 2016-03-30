require 'rails_helper'

RSpec.describe PostLikesController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:post) { FactoryGirl.create(:post) }
  let(:post_like) { FactoryGirl.create(:post_like) }

  describe "GET #create" do
    it "returns http success" do
      sign_in(user)
      post
      get :create, post_id: 1
      expect(response).to redirect_to '/posts'
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      sign_in(user)
      post
      post_like
      get :destroy, post_id: 1
      expect(response).to redirect_to '/posts'
    end
  end
end
