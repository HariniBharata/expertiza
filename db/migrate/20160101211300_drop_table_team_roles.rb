class DropTableTeamRoles < ActiveRecord::Migration[4.2][4.2]
  def change
    drop_table :team_roles
  end
end
