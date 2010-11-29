class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.integer :kind_id
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.string :abbrev
      t.string :info
      t.string :state
      t.integer :articles_count,:default=>0
      t.timestamps
    end
    add_index :categories, :abbrev, :unique => true
  end

     
  def self.down
    drop_table :categories
  end
end
