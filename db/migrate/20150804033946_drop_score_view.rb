class DropScoreView < ActiveRecord::Migration[4.2][4.2]
  def change
    execute <<-SQL
      drop view score_views;
    SQL
  end
end
