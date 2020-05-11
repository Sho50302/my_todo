class RenameStartDatetimeColumnToTasks < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :start_datetime, :start_date
  end
end
