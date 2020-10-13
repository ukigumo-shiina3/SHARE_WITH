class AddColumnToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :event_date, :date
    add_column :events, :event_hour, :integer
    add_column :events, :event_minute, :integer
    add_column :events, :recruitment, :string
  end
end
