class Manufacturer < ActiveRecord::Base
  has_many :cars

  validates :name, presence: true, uniqueness: true,
  length: {
  minimum: 2,
  maximum: 25
  }
  validates :country, presence: true
  validates :description, length: { maximum: 500 }
end
