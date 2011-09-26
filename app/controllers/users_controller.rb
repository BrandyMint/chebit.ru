class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
  end

  def index
    @tags = params[:tags]
    @users = @tags ? User.tagged_with(@tags) : User.all
  end
end
