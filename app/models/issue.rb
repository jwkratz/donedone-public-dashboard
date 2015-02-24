class Issue < ActiveRecord::Base
  belongs_to :project
  has_many :issue_attachments
  has_many :issue_histories

  scope :active, -> { where('status not in (?)', ['Closed', 'Fixed']) }
  scope :inactive, -> { where('status in (?)', ['Closed', 'Fixed']) }

  def self.sync_from_api
    DoneDoneApi.sync_issues
  end
end
