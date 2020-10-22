class RemoveEventMinuteFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :event_minute, :integer
  end
end
