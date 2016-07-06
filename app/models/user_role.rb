class UserRole < ActiveRecord::Base

  before_create :user_not_associated_with_charity?

  belongs_to :user
  belongs_to :role
  belongs_to :charity

private

  def user_not_associated_with_charity?
    if UserRole.find_by(user_id: user_id)
      return false
    else
      return true
    end
  end
end
