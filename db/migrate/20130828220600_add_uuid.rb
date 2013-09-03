class AddUuid < ActiveRecord::Migration
  def up
    add_column :issues, :uuid, :string
  end

  def down
    remove_column :issues, :uuid
  end

end