module Import

  class OrderImportService
    
    def initialize(stream)
		@stream = stream
		@orders = []
    end

    def import
      
		ActiveRecord::Base.transaction do
			Parser::StreamParser.new(@stream).parse do |values|
				import_row(FileRow.new(values)) 
			end
		end
    end
    
    def orders
		@orders
    end
    
    def total
		@orders.each.inject(0) { |sum, order| sum + order.price }
    end
    
    private
    
    def import_row(row)
      
		customer = Customer.find_or_create(row.purchaser_name)
		store = Store.find_or_create(row.merchant_name, row.merchant_address)
		product = Product.find_or_create(row.item_description, row.item_price, store)
      
		order = Order.create(customer: customer)
		order.add_item(product, row.purchase_count)
      
		@orders << order
    end
  end
end