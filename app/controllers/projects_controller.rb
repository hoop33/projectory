require 'active_support'

class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @weeks = Array.new
    date = DateTime.now.beginning_of_week
    8.times do
      week = Week.where("start = ?", date.to_date).first
      if week.nil?
        week = Week.new
        week.start = date.beginning_of_week
      end
      @weeks << week
      date += 7
    end
  end

  def show
    @project = Project.find(params[:id])
  end
  
  def new
    @project = Project.new
    @project.color = '#009900';
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      redirect_to(:projects, :notice => "Project #{@project.title} created")
    else
      render :action => 'new'
    end
  end
end
