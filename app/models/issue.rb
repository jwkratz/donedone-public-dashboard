class Issue < ActiveRecord::Base
  belongs_to :project
  belongs_to :priority
  belongs_to :status
end
