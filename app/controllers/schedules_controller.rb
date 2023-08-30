class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
    @count = Schedule.count()
    @now = Time.now
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :memo))
    if @schedule.save
      redirect_to :schedules
    else
      render :new
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
      redirect_to :schedules
    else
      render :edit
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @saved = @schedule.destroy
    redirect_to :schedules
  end
end
