class Comment < ActiveRecord::Base
  belongs_to :issue
  belongs_to :user

  before_create :generate_floor
  def generate_floor
    num = Comment.where(issue_id: self.issue_id).last
    self.floor = (num.present? ? num.floor+1 : 1)
  end
end
