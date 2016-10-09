require 'spec_helper'

describe UsersController do
  
  describe 'guest access' do

    it "POST#create_login_session redirects to the login form" do
      post :create_login_session, user: attributes_for(:user)
      expect(response).to redirect_to login_url
    end

  end

  describe 'user access' do

    before :each do
      @user = create(:user)
      session[:user_id] = @user.id
    end

    describe 'GET#signup' do
      it "sets up a new, empty user" do
        get :signup
        expect(assigns(:user)).to be_a_new(User)
      end

      it "renders the :signup template" do
        get :signup
        expect(response).to render_template(:signup)
      end
    end

    describe 'POST#create' do
      context "with valid attributes" do
        it "adds the user" do
          expect{
            post :create, user: attributes_for(:user)
          }.to change(User, :count).by(1)
        end
      end
    end

    it "POST#create_login_session denies access" do
      post :create_login_session, user: attributes_for(:user)
      expect(response).to redirect_to login_url
    end

  end 
   
end  