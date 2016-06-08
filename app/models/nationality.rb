class Nationality < ActiveRecord::Base
  validates :photo_path, presence: true
  validates :info_link, presence: true
  validates :greeting, presence: true
  validates :name, presence: true

  has_many :families
end
