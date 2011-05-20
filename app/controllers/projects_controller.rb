require 'active_support'

class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    do_weeks
  end

  def show
    @project = Project.find(params[:id])
    do_weeks
  end
  
  def new
    @project = Project.new
    @project.color = '#009900'
    do_weeks
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      redirect_to projects_path
    else
      render :action => 'new'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  def change
    @project = Project.find(params[:project_id])
    @week = Week.find(params[:week_id])
    if (params[:requested_action] == 'delete')
      @project.weeks.delete @week
    else
      @project.weeks << @week
    end

    redirect_to params[:redirect_path]
  end

private

  def do_weeks
    @weeks = Array.new
    date = DateTime.now.beginning_of_week
    10.times do
      week = Week.where("start = ?", date.to_date).first
      puts week
      if week.nil?
        week = Week.new
        week.start = date.beginning_of_week.to_date
        week.save
      end
      @weeks << week
      date += 7
    end
  end

end
