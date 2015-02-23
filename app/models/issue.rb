class Issue < ActiveRecord::Base
  belongs_to :project

  def self.sync_from_api
    DoneDoneApi.sync_issues
  end
end
