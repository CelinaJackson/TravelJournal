class DeleteSavedTripsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :saved_trips
  end
end
