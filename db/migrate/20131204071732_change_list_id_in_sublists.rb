class ChangeListIdInSublists < ActiveRecord::Migration
  def up
    change_column :sublists, :list_id, :integer
  end

  def down
    change_column :sublists, :list_id, :string
  end
end
