class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.belongs_to :skatepark, index: true
      t.belongs_to :user, index: true
      t.boolean :attending, default: false

      t.timestamps null: false
    end
  end
end
