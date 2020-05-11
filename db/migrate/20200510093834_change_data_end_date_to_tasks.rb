class ChangeDataEndDateToTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :end_date, :date
  end
end
