class CreateArticleContents < ActiveRecord::Migration
  def self.up
    create_table :article_contents do |t|
      t.integer :article_id
      t.text :content
      t.timestamps
    end
    add_index :article_contents,:article_id
  end

  def self.down
    drop_table :article_contents
  end
end
