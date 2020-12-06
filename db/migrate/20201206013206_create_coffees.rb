class CreateCoffees < ActiveRecord::Migration
  def change
    create_table :coffees do |t|
      t.string :brand
      t.string :flavor
      t.string :roast
      t.float :rating
    end 
  end
end
