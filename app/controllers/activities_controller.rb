# Контроллер активностей
class ActivitiesController < ApplicationController
  autocomplete :approved_knowledge, :name, full: true, extra_data: [:link]
  load_and_authorize_resource except: [:index, :show]

  def index
    if current_user
      @activities = Activity.all.order(created_at: :desc)
        .group_by { |d| d.created_at.beginning_of_day }
      @activities_keys = @activities.keys.paginate(page: params[:page], per_page: 7)
    end
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = current_user.activities.build(activity_params)

    if @activity.save
      unless @activity.knowledge_id
        @activity.update_attribute(:knowledge, Knowledge.find_by(name: activity_params[:name]))
        # @activity.knowledge_id = Knowledge.find_by(name: activity_params[:name]).id
        @activity.save
      end
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
    @activity.destroy
    redirect_to root_path, notice: 'Активность удалена'

  end

  def show
    @activity = user_activity
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :comment, :link, :time_spent, :kind,
                                     :knowledge_id, :tag_list)
  end

  def user_activity
    current_user.activities.find(params[:id])
  end
end
