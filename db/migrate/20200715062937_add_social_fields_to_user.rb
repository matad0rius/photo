class AddSocialFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :uid, :string
    add_column :users, :provider, :string
    add_column :users, :username, :string, null: false, default: ""
    add_column :users, :name, :string
    add_column :users, :avatar, :string
  end
end
