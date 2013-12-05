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
    @sublist = @list.sublists.create(params[:sublist])
    @sublists_2 = @list.sublists.where(:status => false)
    render 'lists/sublists_isnot_completed', :layout => false
  end

  def edit
    @sublist = Sublist.find(params[:id])
  end

  def update
    @sublist = Sublist.find(params[:id])
    if @sublist.update_attributes(params[:sublist])
      redirect_to list_path(@list)
    else
      render :action => "edit"
    end    
  end
  
  def update_status
    @sublist = Sublist.find(params[:id])
    @sublist.status = !@sublist.status 
    @sublist.save
    render :text => "successful"
  end  
end
