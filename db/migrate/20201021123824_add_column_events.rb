class AddColumnEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :open_hour, :integer
    add_column :events, :open_minute, :integer
    add_column :events, :end_hour, :integer
    add_column :events, :end_minute, :integer
  end
end
