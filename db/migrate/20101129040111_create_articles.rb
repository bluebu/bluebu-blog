class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.integer :user_id
      t.integer :category_id
      t.string  :chanel
      t.string  :title, :null => false
      t.string  :avatar_file_name
      t.string  :avatar_content_type
      t.integer  :avatar_file_size
      t.datetime  :avatar_updated_at
      t.string  :content, :limit => 255
      t.string  :author, :limit => 100
      t.integer :posts_count, :default => 0
      t.integer :favorite_articles_count, :default => 0
      t.integer :good_articles_count, :default => 0
      t.string  :origin
      t.string  :origin_url
      t.timestamps
    end
    add_index :articles, :user_id
    add_index :articles, :category_id
    add_index :articles, :created_at
    add_index :articles, :posts_count
    add_index :articles, :good_articles_count
    add_index :articles, :favorite_articles_count
  end

  def self.down
    drop_table :articles
  end
end
