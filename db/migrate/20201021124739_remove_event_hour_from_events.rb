class RemoveEventHourFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :event_hour, :integer
  end
end
