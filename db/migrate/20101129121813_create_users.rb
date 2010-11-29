class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users, :id => false, :primary_key => 'id' do |t|
      # 客户管理系统同步数据
      t.integer :id
      t.string :username
      t.string :email
      t.string :encrypted_password
      
      # 密码和令牌
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.string :single_access_token
      
      # 临时令牌，供找回密码或确认注册使用
      t.string :perishable_token
      t.datetime :perishable_token_at
      
      # 用户角色
      t.integer :role_id
      t.string :role_names
      
      # 登录记录
      t.integer :login_count, :default => 0
      t.integer :failed_login_count, :default => 0
      t.datetime :last_request_at
      t.datetime :current_login_at
      t.datetime :last_login_at
      t.string :current_login_ip
      t.string :last_login_ip
      
      # 用户状态
      t.boolean :active, :default => true
      t.boolean :approved, :default => true
      t.boolean :confirmed, :default => true
      
      # 用户禁止状态
      t.boolean :disabled, :default => false
      t.boolean :deleted, :default => false

      t.integer :lock_version, :default => 0
      
      # 用户注册IP
      t.string :register_ip

      t.timestamps
    end
    
    # 建立索引
    change_table :users do |t|
      t.index :id
      t.index :username
      t.index :email
      t.index :persistence_token
      t.index :perishable_token
      t.index :single_access_token
    end
  end

  def self.down
    drop_table :users
  end
end
