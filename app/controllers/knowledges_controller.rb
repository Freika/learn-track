class KnowledgesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :update, :edit]

  def index
    @knowledges = Knowledge.where(approved: true).order(created_at: :desc)
  end

  def show
    @knowledge = Knowledge.find(params[:id])
  end

  def edit
    @knowledge = Knowledge.find(params[:id])
    authorize! :edit, @knowledge, message: 'Доступно только администратору.'
  end

  def update
    @knowledge = Knowledge.find(params[:id])
    authorize! :update, @knowledge, message: 'Доступно только администратору.'
    if @knowledge.update(knowledge_params)
      redirect_to @knowledge, notice: 'Зание успешно обновлено'
    else
      render :edit
    end
  end

  def new
    @knowledge = Knowledge.new
    authorize! :new, @knowledge, message: 'Доступно только зарегистрированным.'
  end

  def create
    @knowledge = Knowledge.new(knowledge_params)
    authorize! :create, @knowledge, message: 'Доступно только зарегистрированным.'
    if @knowledge.save
      redirect_to @knowledge, notice: 'Знание успешно добавлено'
    else
      render :new
    end
  end

  def destroy
    @knowledge = Knowledge.find(params[:id])
    authorize! :destroy, @knowledge, message: 'Доступно только администратору.'
    @knowledge.destroy
    redirect_to knowledges_path, notice: 'Знание удалено'
  end

  private

  def knowledge_params
    params.require(:knowledge).permit(:name, :description, :link, :kind,
                                      :approved)
  end
end
