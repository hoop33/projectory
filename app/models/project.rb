class Project < ActiveRecord::Base
  validates :title, :presence => true, :uniqueness => true
  has_many :project_weeks
  has_many :weeks, :through => :project_weeks, :uniq => true

  def num_weeks_scheduled weeks
    num = 0
    weeks.each do |week|
      if self.weeks.include?(week)
        num += 1
      end
    end
    num
  end
end
