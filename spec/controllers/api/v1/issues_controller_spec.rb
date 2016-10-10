require 'spec_helper'
require 'awesome_print'

RSpec.describe Api::V1::IssuesController, type: :controller do

  render_views
  
  describe "GET #show" do

    before do
      @user = User.create(email: 'test@mail.com', password: '123456')
      @request.headers['Authorization'] = "Token token=#{@user.authentication_token}, email=#{@user.email}"  # 问题point
    end

    after do
      @request.headers['Authorization'] = nil
    end

    it "returns http success" do
      get :show, { id: @user.to_param, format: :json }

      ap response.body
      expect(response).to be_success
    end
    
  end
end