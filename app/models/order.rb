class Order < ActiveRecord::Base
	
	belongs_to :customer
	has_many :items
	after_initialize :init

	def init
		self.price ||= 0
	end

	def add_item(product, quantity)
		item = Item.create(order: self, product: product, quantity: quantity, price: product.price * quantity)
		self.update(price: self.price + item.price)
	end
	
end
