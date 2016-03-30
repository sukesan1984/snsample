require 'rails_helper'

RSpec.describe PostLikesController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      sign_in
      get :index, post_id: 1
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      sign_in
      get :create, post_id: 1
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      sign_in
      get :destroy, post_id: 1
      expect(response).to have_http_status(:success)
    end
  end
end
