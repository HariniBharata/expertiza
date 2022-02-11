class CreateTeamNodes < ActiveRecord::Migration[4.2][4.2]
  def self.up
    teams = Team.all
    teams.each{
      | team |
      parent = AssignmentNode.find_by_node_object_id(team.parent_id)
      if parent
        TeamNode.create(:node_object_id => team.id, :parent_id => parent.id)
      end
    }
  end

  def self.down
    nodes = TeamNode.all
    nodes.each{
      |node|
      node.destroy
    }
  end
end
