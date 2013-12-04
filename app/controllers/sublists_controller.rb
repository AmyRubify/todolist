class SublistsController < ApplicationController
  def index
    @sublists = Sublist.all
  end

  def destroy
    @sublist = Sublist.find(params[:id])
    @sublist.destroy
    redirect_to :action => :index
  end

  def show
    @sublist = Sublist.find(params[:id])
  end

  def new
    @sublist = Sublist.new
  end

  def create
    @list = List.find(params[:list_id])
    @sublist = @list.sublists.new(params[:sublist])
    if @sublist.save
      redirect_to list_path(@list)
    else
      render :action => "new"      
    end
  end

  def edit
    @sublist = Sublist.find(params[:id])
  end

  def update
    @sublist = Sublist.find(params[:id])
    @sublist.status = true
    if @sublist.update_attributes(params[:sublist])
      redirect_to list_path(@list)
    else
      render :action => "edit"
    end    
  end
end
