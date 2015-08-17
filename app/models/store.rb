class Store < ActiveRecord::Base
	def self.find_or_create(name, address)
		self.find_by(name: name) || self.create(name: name, address: address)
	end
end