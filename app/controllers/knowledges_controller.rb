class KnowledgesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :update, :edit]

  def index
    @knowledges = Knowledge.all
  end

  def show
    @knowledge = Knowledge.find(params[:id])
  end

  def edit
    @knowledge = Knowledge.find(params[:id])
    redirect_to root_path, notice: "Доступ запрещен." unless current_user && current_user.admin
  end

  def update
    @knowledge = Knowledge.find(params[:id])
    if @knowledge.update(knowledge_params)
      redirect_to @knowledge, notice: "Зание успешно обновлено"
    else
      render :edit
    end
  end

  def new
    @knowledge = Knowledge.new
  end

  def create
    @knowledge = Knowledge.new(knowledge_params)
    if @knowledge.save
      redirect_to @knowledge, notice: "Знание успешно добавлено"
    else
      render :new
    end
  end

  def destroy
    @knowledge = Knowledge.find(params[:id])
    @knowledge.destroy
    redirect_to knowledges_path, notice: "Знание удалено"
  end

  private

  def knowledge_params
    params.require(:knowledge).permit(:name, :description, :link, :kind)
  end
end
