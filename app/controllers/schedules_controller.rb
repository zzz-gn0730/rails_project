class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
    @count = Schedule.count
    @now = Time.now
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :memo))
    if @schedule.save
      flash[:notice] = "Added schedule"
      redirect_to :schedules
    else
      flash[:alert] = "Unable to register appointment"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :memo ))
      flash[:notice] = "Updated schedule"
      redirect_to :schedules
    else
      flash[:alert] = "Unable to update appointment"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @saved = @schedule.destroy
    flash[:notice] = "Appointment deleted"
    redirect_to :schedules
  end
end
