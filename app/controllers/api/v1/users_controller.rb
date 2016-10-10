class Api::V1::UsersController < Api::V1::BaseController   

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      self.current_user = @user
      render :login
	  else
		  msg = @user.present? ? '密码错误' : '用户不存在'
		  render json: {:status => :failure, :msg => msg}.to_json
  	end
  end

end