class CreateParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :participants do |t|
      t.belongs_to :user
      t.belongs_to :project
    end
    add_index :participants, [:user_id, :project_id], unique: true
  end
end
