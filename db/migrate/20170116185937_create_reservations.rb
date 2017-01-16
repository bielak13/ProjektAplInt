class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.datetime :date_start
      t.datetime :date_stop
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
