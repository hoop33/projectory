class Project < ActiveRecord::Base
  validates :title, :presence => true, :uniqueness => true
  has_many :project_weeks
  has_many :weeks, :through => :project_weeks

end
