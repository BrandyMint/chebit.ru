class VacanciesController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  before_filter :authorized_user, :only => [:destroy, :edit, :update]
  
  def new
    @vacancy = Vacancy.new
  end
  
  def index
    @vacancies = Vacancy.where("active_until >= ?", Time.now).paginate(:page => params[:page], :per_page => 10, :order => 'id DESC')
  end

  def show
    @vacancy = Vacancy.find_by_id(params[:id]) 
  end
  
  def edit
  end
  
  def update
    if @vacancy.update_attributes(params[:vacancy])
      flash[:success] = "Vacancy edited!"
      redirect_to vacancies_path
    else
      flash[:error] = "Vacancy not edited!"
      render 'edit'
    end
  end
  
  def create
    @vacancy  = current_user.vacancies.build(params[:vacancy])
    if @vacancy.active_until.nil?
      @vacancy.active_until = 1.month.since
    end
    if @vacancy.save
      flash[:success] = "Vacancy created!"
      redirect_to vacancies_path
    else
      flash[:error] = "Vacancy not created!"
      @vacancy.title.clear
      @vacancy.text.clear
      render 'new'
    end
  end
  
  def destroy
    @vacancy.destroy
    redirect_to vacancies_path
  end
  
  private
  
  def authenticate
    deny_access unless signed_in? 
  end
  
  def deny_access
    store_location
    redirect_to signin_path, :notice => "Please sign in to access this page."
  end
  
  def authorized_user
    @vacancy = current_user.vacancies.find_by_id(params[:id])
    redirect_to root_path if @vacancy.nil?
  end
  
end