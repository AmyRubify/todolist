class CreateSublists < ActiveRecord::Migration
  def change
    create_table :sublists do |t|
      t.string :parentlist
      t.string :name

      t.timestamps
    end
  end
end
