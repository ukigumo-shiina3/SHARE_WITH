class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.string :title
      t.text :body
      t.datetime :start
      t.datetime :end
      t.string :allDay

      t.timestamps
    end
  end
end
