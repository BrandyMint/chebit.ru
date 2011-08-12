class VacanciesController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  before_filter :authorized_user, :only => [:destroy]
  
  def new
    @vacancy = Vacancy.new
  end
  
  def index
    @vacancies = Vacancy.paginate(:page => params[:page], :per_page => 20)
  end

  def show
    @vacancy = Vacancy.find_by_id(params[:id]) 
  end
  
  def create
    @vacancy  = current_user.vacancies.build(params[:vacancy])
    @vacancy[:active_until] = 1.month.ago
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