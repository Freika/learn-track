# Контроллер активностей
class ActivitiesController < ApplicationController
  autocomplete :approved_knowledge, :name, full: true, extra_data: [:link]

  def index
    # @activities = Activity.all
    if current_user
      @activities = Activity.all.order(created_at: :desc)
        .group_by { |d| d.created_at.beginning_of_day }
    end
  end

  def new
    @activity = Activity.new
    authorize! :new, @activity, message: 'Доступно только зарегистрированным.'
  end

  def create
    @activity = current_user.activities.build(activity_params)
    authorize! :create, @activity, message: 'Доступно только зарегистрированным.'

    if @activity.save
      redirect_to @activity, notice: 'Активность создана'
    else
      render :new
    end
  end

  def edit
    @activity = user_activity
  end

  def update
    @activity = user_activity
    if @activity.update(activity_params)
      redirect_to @activity, notice: 'Активность обновлена'
    else
      render :edit, notice: 'Исправьте ошибки'
    end
  end

  def destroy
    @activity = user_activity
  end

  def show
    # @activity = Activity.find(params[:id])
    @activity = user_activity
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :comment, :link, :time_spent, :kind,
                                     :knowledge_id)
  end

  def user_activity
    current_user.activities.find(params[:id])
  end
end
