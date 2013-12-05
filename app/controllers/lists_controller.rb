class ListsController < ApplicationController
before_filter :authenticate_user!
  def index
    @lists = current_user.lists.all
  end

  def destroy
    @list = current_user.lists.find(params[:id])
    @list.destroy
    redirect_to :action => :index
  end

  def show
    @list = current_user.lists.find(params[:id])
    @sublists = Sublist.where(:list_id => @list.id , :status => false)
    @sublists_2 = Sublist.where("list_id = ? AND status !=  ?", @list.id, false)
  end

  def new
    @list = current_user.lists.new
    @list.author = "Amy"
  end

  def create
    @list = current_user.lists.new(params[:list])
    if @list.save
      redirect_to :action => :index
    else
      render :action => "new"      
    end
  end

  def edit
    @list = current_user.lists.find(params[:id])
  end

  def update
    @list = current_user.lists.find(params[:id])
    if @list.update_attributes(params[:list])
      redirect_to list_path(@list)
    else
      render :action => "edit"
    end    
  end
  
  def sublists_is_completed
    @list = current_user.lists.find(params[:id])
    @sublists = @list.sublists.where(:status => true)
    render :layout => false
  end  
  
  def sublists_isnot_completed
    @list = current_user.lists.find(params[:id])
    @sublists_2 = @list.sublists.where(:status => false)
    render :layout => false
  end  
end
