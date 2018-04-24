class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :category
      t.text :description
      t.string :address
      t.references :user, foreign_key: true
      t.float :latitude
      t.float :longitude
      t.integer :price_cents
      t.string :gender

      t.timestamps
    end
  end
end
