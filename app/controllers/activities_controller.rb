class ActivitiesController < ApplicationController
  def index
  end

  def new
    @activity = Activity.new
    authorize! :new, @activity, message: 'Доступно только зарегистрированным.'
  end

  def create
    @activity = Activity.new(activity_params)
    authorize! :new, @activity, message: 'Доступно только зарегистрированным.'
    if @activity.save
      redirect_to @activity, notice: 'Активность создана'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @activity = Activity.find(params[:id])
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :comment, :link, :time_spent, :kind)
  end
end
