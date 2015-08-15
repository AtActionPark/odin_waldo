class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :left
      t.integer :top
      t.integer :width
      t.integer :height

      t.timestamps null: false
    end
  end
end
