class AddBuildIdToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :build_id, :integer
  end
end
