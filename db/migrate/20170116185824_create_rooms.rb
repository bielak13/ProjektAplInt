class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :number
      t.integer :type_id
      t.integer :room_id

      t.timestamps
    end
  end
end
