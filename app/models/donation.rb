class Donation < ActiveRecord::Base
  validates :status, presence: true, inclusion: %w(Pledged Received Cancelled)

  belongs_to :user
  has_many :donation_items

  def date
    created_at.to_date
  end

  def total
    donation_items.reduce(0) do |sum, item|
      sum += item.subtotal
    end
  end
end
