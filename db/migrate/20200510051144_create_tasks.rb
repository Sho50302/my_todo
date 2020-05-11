class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title,          null: false
      t.text :content
      t.datetime :start_datetime
      t.datetime :end_datetime

      t.timestamps
    end
  end
end
