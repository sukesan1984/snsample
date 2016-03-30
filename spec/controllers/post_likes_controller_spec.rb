require 'rails_helper'

RSpec.describe PostLikesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index, post_id: 1
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create, post_id: 1
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, id: 1, post_id: 1
      expect(response).to have_http_status(:success)
    end
  end

end
