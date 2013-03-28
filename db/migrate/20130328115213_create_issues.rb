class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :text
      t.string :summary

      t.timestamps
    end
  end
end
