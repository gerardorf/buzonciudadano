class CreateIssues < ActiveRecord::Migration
  def up
    create_table :issues do |t|
      t.string :text
      t.string :summary
      t.string :fullname
      t.string :address
      t.string :images
    end
  end

  def down
    drop_table :issues
  end
end
