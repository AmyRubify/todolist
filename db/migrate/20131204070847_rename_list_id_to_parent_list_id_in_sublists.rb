class RenameListIdToParentListIdInSublists < ActiveRecord::Migration
  def up
    rename_column :sublists,:parentlist, :list_id
  end

  def down
    rename_column :sublists, :list_id, :parentlist
  end
end
