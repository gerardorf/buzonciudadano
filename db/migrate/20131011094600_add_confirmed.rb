class AddConfirmed < ActiveRecord::Migration
  def up
    add_column :issues, :confirmed, :boolean
  end

  def down
    remove_column :issues, :confirmed
  end

end