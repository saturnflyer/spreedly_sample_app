class CreateFeatureLevels < ActiveRecord::Migration
  def self.up
    create_table :feature_levels do |t|
      t.string :name
      t.string :standard_plan_name

      t.timestamps
    end
    add_index :feature_levels, :name, :unique => true
  end

  def self.down
    remove_index :feature_levels, :name
    drop_table :feature_levels
  end
end
