class IssuesController < ApplicationController
  before_action :authenticate, except: [:index, :show]
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  def show
     @comments = @issue.comments
  end

  def new
    @issue = Issue.new
  end

  def edit
         
  end

  def create
    Issue.create(issue_params)
    redirect_to :root
  end

  def update
    @issue.update_attributes(issue_params)
    redirect_to :root
  end

  def destroy
    @issue.destroy
    redirect_to :root
  end

  private
    def set_issue
      @issue = Issue.find(params[:id])
    end

    def issue_params
      params.require(:issue).permit(:title, :content, :user_id)
    end
end
