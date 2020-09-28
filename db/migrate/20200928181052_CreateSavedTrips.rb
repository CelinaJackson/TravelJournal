class CreateSavedTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :saved_trips do |t|
      t.integer :saving_user_id
  end
end
