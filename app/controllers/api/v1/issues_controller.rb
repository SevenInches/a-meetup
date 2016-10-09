class Api::V1::IssuesController < Api::V1::BaseController	 
  before_action :authenticate_user!, except: [:index]
  before_action :set_issue, only: [:show, :update, :destroy]

  def index
    @issues  = Issue.all
    @total   = @issues.count
  end

  def show
     @comments = @issue.comments
  end

  def update
    if @issue.update_attributes(issue_params)
      render :show
    else
      render json: { status: 'failure' }.to_json
    end  
  end

  def destroy
    if @issue.destroy
      render json: { status: 'success' }.to_json
    else  
      render json: { status: 'failure' }.to_json
    end
  end

  private
    def set_issue
      @issue = Issue.find(params[:id])
    end

    def issue_params
      params.permit(:title, :content, :user_id)
    end
end