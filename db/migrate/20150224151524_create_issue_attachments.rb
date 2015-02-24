class CreateIssueAttachments < ActiveRecord::Migration
  def change
    create_table :issue_attachments do |t|
      t.references :issue, index: true
      t.integer :attachment_id
      t.string :path

      t.timestamps null: false
    end
    add_foreign_key :issue_attachments, :issues
  end
end
