require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:post) { FactoryGirl.create(:post) }
  describe "GET #index" do
    it "returns http success" do
      sign_in
      get :index, post_id: 1
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      post
      sign_in
      get :new, post_id: 1
      expect(response).to have_http_status(:success)
    end
  end
end
