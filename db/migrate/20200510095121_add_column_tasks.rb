class AddColumnTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :start_time_hour, :time
    add_column :tasks, :start_time_minute, :time
    add_column :tasks, :end_time_hour, :time
    add_column :tasks, :end_time_minute, :time
  end
end
