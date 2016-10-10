class CreateRoomTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :room_types do |t|
      t.string :name
      t.string :description
      t.string :price_per_night

      t.timestamps
    end
  end
end
