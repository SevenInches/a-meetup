class Api::V1::UsersController < Api::V1::BaseController   

  def login
    @user = User.find_by_name(params[:name])
    if @user && @user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = @user.auth_token
      else
        cookies[:auth_token] = @user.auth_token
      end
      current_user = @user
      render 'index'
	else
		msg = @user.present? ? '密码错误' : '用户不存在'
		{:status => :failure, :msg => msg}.to_json
  	end
  end	 

end