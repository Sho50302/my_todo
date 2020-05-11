class RenameEndDatetimeColumnToTasks < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :end_datetime, :end_date
  end
end
