class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.string :description
      t.datetime :due_date
      t.belongs_to :user
      t.belongs_to :project

      t.timestamps null: false
    end
  end
end
