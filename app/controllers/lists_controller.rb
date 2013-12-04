class ListsController < ApplicationController
  
  def index
    @lists = List.all
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to :action => :index
  end

  def show
    @list = List.find(params[:id])
    @sublists = Sublist.where(:list_id => @list.id , :status => false)
    @sublists_2 = Sublist.where("list_id = ? AND status !=  ?", @list.id, false)
  end

  def new
    @list = List.new
    @list.author = "Amy"
  end

  def create
    @list = List.new(params[:list])
    if @list.save
      redirect_to :action => :index
    else
      render :action => "new"      
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(params[:list])
      redirect_to :action => :index
    else
      render :action => "edit"
    end    
  end
end
