class CreateStores < ActiveRecord::Migration
	def change
		create_table :stores do |t|
			t.string :name, null: false
			t.string :address, null: false
			t.timestamps null: false
		end
		
		add_index :stores, :name, unique: true
		
	end
end