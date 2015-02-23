class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.integer :order_number
      t.references :project, index: true
      t.datetime :created_on
      t.datetime :last_updated_on
      t.string :last_updater
      t.string :tester
      t.string :fixer
      t.string :creator
      t.string :priority
      t.string :status
      t.date :due_date

      t.timestamps null: false
    end
    add_foreign_key :issues, :projects
  end
end
