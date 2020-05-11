class ChangeDataToTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :start_time_hour, :integer
    change_column :tasks, :start_time_minute, :integer
    change_column :tasks, :end_time_hour, :integer
    change_column :tasks, :end_time_minute, :integer
  end
end
