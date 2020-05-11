class AddTasks < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :user, foreign_key: true
    add_reference :tasks, :group, foreign_key: true
  end
end
