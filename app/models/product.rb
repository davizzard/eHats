class Product < ApplicationRecord
  has_and_belongs_to_many :categories
  has_many :product_quantities
  has_many :orders, through: :product_quantities

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
end
