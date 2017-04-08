class ChangeParticipantsToContributors < ActiveRecord::Migration[5.0]
  def up
    rename_table :participants, :contributors
  end

  def down
    rename_table :contributors, :participants
  end
end
