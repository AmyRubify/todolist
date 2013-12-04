class AddStatusToSublists < ActiveRecord::Migration
  def change
    add_column :sublists, :status, :boolean, :default => false
  end
end
