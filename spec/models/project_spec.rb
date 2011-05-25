require 'spec_helper'

describe 'Project' do

  before(:each) do
    @attr = {
      :title => 'Test Project',
      :description => 'This is a test project',
      :color => '#00ff00',
      :target_date => Time.now
    }
  end

  it "should create a new project given valid attributes" do
    Project.create!(@attr)
  end
end