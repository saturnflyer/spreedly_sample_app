class CreateFeatureAttributes < ActiveRecord::Migration
  def self.up
    create_table :feature_attributes do |t|
      t.string :name
      t.text :description
      t.integer :feature_level_id

      t.timestamps
    end
    add_index :feature_attributes, :feature_level_id
  end

  def self.down
    remove_index :feature_attributes, :feature_level_id
    drop_table :feature_attributes
  end
end
