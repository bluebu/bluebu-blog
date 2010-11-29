class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts, :force => true do |t|
      t.integer :user_id
      t.string :content,:limit=>210
      t.string :logo,:limit=>50
      t.integer :forward_posts_count,:default=>0 
      t.integer :favorite_posts_count,:default=>0
      t.boolean :is_hide,:default=>false
      t.integer :article_id
      t.integer :forward_post_id
      t.integer :forward_user_id
      t.integer :category_id
      
      t.timestamps
    end
    add_index :posts, :user_id
    add_index :posts, :article_id
    add_index :posts, :created_at
    add_index :posts, :category_id
    add_index :posts, :is_hide
    add_index :posts, :forward_posts_count
    add_index :posts, :favorite_posts_count
    add_index :posts, :forward_post_id
    add_index :posts, :forward_user_id
  end

  def self.down
    drop_table :posts
  end
end
