class Donation < ActiveRecord::Base
  belongs_to :user
  has_many :donation_items


  def date
    created_at.to_date
  end

end
