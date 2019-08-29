class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true

  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def sold_out?
    self.quantity == 0 ? true : false
  end

end
