class CreateIssueHistoryAttachments < ActiveRecord::Migration
  def change
    create_table :issue_history_attachments do |t|
      t.references :issue_history, index: true
      t.integer :attachment_id
      t.string :path

      t.timestamps null: false
    end
    add_foreign_key :issue_history_attachments, :issue_histories
  end
end
