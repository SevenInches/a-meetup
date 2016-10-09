class Api::V1::llIssuesController < Api::V1::BaseController	 	

  require 'rack'

  class Authentic
    def initialize(app)
      @app = app
      @header_name = "X-Authentic"
    end

    def call(env)
      status, headers, body = @app.call(env)

      if !current_user.present?
        status = 401
        headers = {"Content-Type" => "text/json"}
        body = ["用户认证失败,请重新登陆"]
      end
    end
  end


  def index
    @issues  = Issue.all
    @total   = @issues.count
  end 
  
end