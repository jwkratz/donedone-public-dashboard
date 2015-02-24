class CreateIssueHistories < ActiveRecord::Migration
  def change
    create_table :issue_histories do |t|
      t.references :issue, index: true
      t.integer :history_id
      t.datetime :created_on
      t.string :action
      t.string :description
      t.string :creator

      t.timestamps null: false
    end
    add_foreign_key :issue_histories, :issues
  end
end
