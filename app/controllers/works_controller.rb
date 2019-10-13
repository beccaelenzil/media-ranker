class WorksController < ApplicationController
  def index
    @works_by_category = Work.organize_work_by_category
  end

  def show
    #work = Work.find_by(id: params[:id])
  end

  def new
    #work = Work.create()
  end

end
