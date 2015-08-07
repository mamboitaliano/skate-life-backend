class CreateSkateparks < ActiveRecord::Migration
  def change
    create_table :skateparks do |t|
      t.string :name
      t.string :address

      t.timestamps null: false
    end
  end
end
