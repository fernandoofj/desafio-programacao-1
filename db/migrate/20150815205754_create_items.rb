class CreateItems < ActiveRecord::Migration
    def change
		
		create_table :items do |t|
			t.references :order, index: true
			t.references :product, index: true
			t.integer :quantity, null: false
			t.decimal :price, precision: 12, scale: 2, null: false
			t.timestamps null: false
		end
    
		add_foreign_key :order_details, :orders
		add_foreign_key :order_details, :products
		
	end
end
