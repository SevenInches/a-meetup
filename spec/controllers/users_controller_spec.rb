require 'spec_helper'

describe UsersController do
  describe 'guest access' do
    it "GET#login redirects to the login form" do
      get :login
      expect(response).to redirect_to login_url
    end

    it "GET#create redirects to the login form" do
      get :create
      expect(response).to redirect_to login_url
    end

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

    describe 'GET#login' do
      it "collects users into @users" do
        user = create(:user)
        get :login
        expect(assigns(:users)).to match_array [@user,user]
      end

      it "renders the :login template" do
        get :login
        expect(response).to render_template :login
      end
    end

    it "GET#create denies access" do
      get :create
      expect(response).to redirect_to root_url
    end

    it "POST#create_login_session denies access" do
      post :create_login_session, user: attributes_for(:user)
      expect(response).to redirect_to root_url
    end
  end
end  