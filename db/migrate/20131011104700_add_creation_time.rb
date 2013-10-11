class AddCreationTime < ActiveRecord::Migration
  def up
    add_column :issues, :created_at, :timestamp
  end

  def down
    remove_column :issues, :created_at
  end

end