require "spec_helper"

describe ProjectsController do
  render_views

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "should list projects" do
      get 'index'
      response.should have_selector('div#projects')
    end

    it "should list weeks" do
      get 'index'
      response.should have_selector('div#weeks')
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end

    it "should list weeks" do
      get 'new'
      response.should have_selector('div#weeks')
    end

    it "should accept title" do
      get 'new'
      response.should have_selector('input#project_title')
    end
  end
end