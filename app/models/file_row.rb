class FileRow

	attr_reader :purchaser_name, :item_description, :item_price, :purchase_count, :merchant_address, :merchant_name

	def initialize(columns)
		@purchaser_name = columns[0]
		@item_description = columns[1]
		@item_price = BigDecimal.new(columns[2])
		@purchase_count = columns[3].to_i
		@merchant_address = columns[4]
		@merchant_name = columns[5]
	end

end