class CreateSkateparks < ActiveRecord::Migration
  def change
    create_table :skateparks do |t|
      t.string :name
      t.string :address
      t.string :lat
      t.string :long
      t.integer :fav_count, default: 0

      t.timestamps null: false
    end
  end
end