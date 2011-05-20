class Week < ActiveRecord::Base
  has_many :project_weeks
  has_many :projects, :through => :project_weeks
end
