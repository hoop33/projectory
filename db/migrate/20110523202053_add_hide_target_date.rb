class AddHideTargetDate < ActiveRecord::Migration
  def self.up
    add_column :projects, :hide_target_date, :boolean
  end

  def self.down
    remove_column :projects, :hide_target_date
  end
end
