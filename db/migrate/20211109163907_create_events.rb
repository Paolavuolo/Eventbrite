class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.datetime :start_date
      t.integer :duration
      t.string :titlte
      t.text :description
      t.integer :price
      t.string :location

      t.timestamps
    end
  end
end
