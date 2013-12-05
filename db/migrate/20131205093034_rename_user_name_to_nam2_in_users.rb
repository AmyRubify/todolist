class RenameUserNameToNam2InUsers < ActiveRecord::Migration
  def up
    rename_column :users,:username, :name2
  end

  def down
    rename_column :users, :name2, :username
  end
end
