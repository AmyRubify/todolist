class UsersController < ApplicationController
  
  def login
    
  end
  
  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :action => :index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    # @user.author = "James"
  end

  def create
    @user = User.new(params[:list])
    if @user.save
      redirect_to :action => :index
    else
      render :action => "new"      
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:list])
      redirect_to :action => :index
    else
      render :action => "edit"
    end    
  end
end
