class CreateBuilds < ActiveRecord::Migration[5.0]
  def change
    create_table :builds do |t|
      t.string :city
      t.string :street
      t.integer :number

      t.timestamps
    end
  end
end
