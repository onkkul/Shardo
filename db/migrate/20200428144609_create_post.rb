class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :image
      t.string :ingredients
      t.string :location
      t.integer :quantity
      t.string :post_age
    end
  end
end
