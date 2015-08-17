class CreateProducts < ActiveRecord::Migration
	def change
		create_table :products do |t|
			t.string :name, null: false
			t.decimal :price, precision: 6, scale: 2, null: false
			t.references :store, index: true
			t.timestamps null: false
		end
		
		add_foreign_key :products, :stores
		
	end
end
