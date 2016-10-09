class Api::V1::BaseController < ApplicationController

  attr_accessor :current_user
  
  def api_error(opts = {})
    render nothing: true, status: opts[:status]
  end
end  