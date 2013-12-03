class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :author
      t.string :name

      t.timestamps
    end
  end
end
