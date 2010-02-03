class AddSpreedlyAttributesToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :active_subscription, :boolean
    add_column :users, :feature_level, :string
  end

  def self.down
    remove_column :users, :feature_level
    remove_column :users, :active_subscription
  end
end
