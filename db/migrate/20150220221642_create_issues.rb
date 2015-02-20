class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.integer :order_number
      t.references :project, index: true
      t.datetime :created_on
      t.datetime :last_updated_on
      t.integer :last_updater_id
      t.integer :tester_id
      t.integer :fixer_id
      t.integer :creator_id
      t.references :priority, index: true
      t.references :status, index: true
      t.date :due_date

      t.timestamps null: false
    end
    add_foreign_key :issues, :projects
    add_foreign_key :issues, :priorities
    add_foreign_key :issues, :statuses
  end
end
