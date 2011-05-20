class CreateProjectWeeks < ActiveRecord::Migration
  def self.up
    create_table :project_weeks do |t|
      t.integer :project_id, :null => false
      t.integer :week_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :project_weeks
  end
end
