class WorksController < ApplicationController
  def root
    # nothing here right now
  end

  def index
    @works_by_category = Work.organize_work_by_category
  end

  def show
    work_id = params[:id]
    @work = Work.find_by(id: work_id)

    if @work.nil?
      redirect_to works_path
      flash[:error] = "Could not find task with id: #{work_id}"
      return
    end
  end

  def new
    @work = Work.new
  end
  
  def create
    work = Work.new(work_params) #instantiate a new work
    if work.save # save returns true if the database insert succeeds
      redirect_to works_path # go to the index so we can see the works in the list
      return
    else # save failed :(
      render :new # show the new work form view again
      return
    end
  end

  def edit
    work_id = params[:id]
    @work = Work.find_by(id: work_id)
  end

  def update
    work_id = params[:id]
    @work = Work.find_by(id: work_id)

    if @work.update(work_params) # save returns true if the database insert succeeds
      redirect_to works_path # go to the index so we can see the works in the list
      return
    else # save failed :(
      render :edit # show the work  to update form view again
      return
    end
  end

  def destroy
    work_id = params[:id]
    @work = Work.find_by(id: work_id)

    if @work.nil?
      head :not_found
      return
    end

    @work.destroy

    redirect_to works_path
  end

  private

  def work_params
    params.require(:work).permit(:title, :description, :creator, :publication_year, :category, :id)
  end

end
