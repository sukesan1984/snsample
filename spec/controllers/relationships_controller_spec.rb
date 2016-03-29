require 'rails_helper'

RSpec.describe RelationshipsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  let(:archer) { FactoryGirl.create(:archer) }
  let(:michael) { FactoryGirl.create(:michael) }
  let(:relationship) { FactoryGirl.create(:relationship) } 
  describe "POST #create" do 
    it "returns http success" do
    user
    michael
    sign_in(user)
    post :create, user_id: 3
    expect(response).to redirect_to '/users'
    end
  end

  describe "DELETE #destroy" do 
    it "returns http success" do
    user
    archer
    relationship
    sign_in(user)
    delete :destroy, user_id: 2
    expect(response).to redirect_to '/users'
    end
  end
end
