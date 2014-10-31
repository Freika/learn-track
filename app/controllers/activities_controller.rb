class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
    authorize! :new, @activity, message: 'Доступно только зарегистрированным.'
  end

  def create
    @activity = Activity.new(activity_params)
    authorize! :create, @activity, message: 'Доступно только зарегистрированным.'
    @activity.user_id = current_user.id
    if @activity.save
      redirect_to @activity, notice: 'Активность создана'
    else
      render :new
    end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update(activity_params)
      redirect_to @activity, notice: 'Активность обновлена'
    else
      render :edit, notice: 'Исправьте ошибки'
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
  end

  def show
    @activity = Activity.find(params[:id])
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :comment, :link, :time_spent, :kind)
  end
end
