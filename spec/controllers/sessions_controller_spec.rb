require 'rails_helper'

describe SessionsController, type: :controller do

  describe "GET 'create'" do

    describe "valid signin" do

      before(:each) do
        @user = FactoryGirl.create(:user)
        expect(User).to receive(:sign_in_from_omniauth).and_return(@user)
      end

      it "should have the user session id" do
        get :create, provider: @user.provider
        expect(session[:user_id]).to eq(@user.id)
      end

      it "should redirect to the root" do
        get :create, provider: @user.provider
        expect(response).to redirect_to(root_path)
      end

      it "should sign the user out" do
        get :create, provider: @user.provider
        get :destroy
        expect(session[:user_id]).to be(nil)
        expect(response).to redirect_to(root_path)
      end

    end
  end
end
