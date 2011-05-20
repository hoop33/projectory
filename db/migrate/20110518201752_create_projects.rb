class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :title, :null => false
      t.string :description
      t.string :color, :null => false
      t.date :target_date

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
