class ProjectWeek < ActiveRecord::Base
  belongs_to :project
  belongs_to :week
end
