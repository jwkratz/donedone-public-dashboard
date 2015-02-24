class IssueHistory < ActiveRecord::Base
  belongs_to :issue
  has_many :issue_history_attachments
end
