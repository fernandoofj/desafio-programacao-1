class Product < ActiveRecord::Base
	
	belongs_to :store
	
	def self.find_or_create(name,price,store)
		self.find_by(name: name, store: store) || self.create(name: name, price: price, store: store)
	end
	
end
