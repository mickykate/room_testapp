class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :introduction
      t.integer :room_rate

      t.timestamps
    end
  end
end
