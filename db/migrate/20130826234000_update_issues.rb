class UpdateIssues < ActiveRecord::Migration
  def up
      add_column :issues, :dni, :string
      add_column :issues, :email, :string
  end

  def down
    remove_column :issues, :email
    remove_column :issues, :dni
  end

end
