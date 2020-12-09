class CreateCoffees < ActiveRecord::Migration[5.2]
  def change
    create_table :coffees do |t|
      t.string :brand
      t.string :flavor
      t.string :roast
      t.float :rating
    end 
  end
end
