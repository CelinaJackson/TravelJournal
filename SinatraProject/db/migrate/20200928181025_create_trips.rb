class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :location
      t.string :description 
      t.integer :user_id 
  end 
  end
end
