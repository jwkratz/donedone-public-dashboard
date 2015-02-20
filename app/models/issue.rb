class Issue < ActiveRecord::Base
  belongs_to :project
  belongs_to :priority
  belongs_to :status
  has_one :fixer, :class_name => "Person", :foreign_key => "id"
  has_one :tester, :class_name => "Person", :foreign_key => "id"
  has_one :creator, :class_name => "Person", :foreign_key => "id"
  has_one :last_updater, :class_name => "Person", :foreign_key => "id"
end
