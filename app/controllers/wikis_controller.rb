class WikisController < ApplicationController

  def index
    @wiki = policy_scope(Wiki)
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end  

  def create
    @wiki = Wiki.new(params.require(:wiki).permit(:title, :body, :private))
    @wiki.user = current_user

    if @wiki.save
      flash[:notice] = "Your Wiki was successfully saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end 
  end

  def edit
    @wiki = Wiki.find(params[:id])
    @user = User.all
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    
    if @wiki.update_attributes(params.require(:wiki).permit(:title, :body))
      flash[:notice] = "Your wiki was successfully updated."
      redirect_to @wiki
    else
      flash[:alert] = "There was an error updating your wiki. Please try again."
      render :edit
    end  
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error deleting the wiki."
      render :show
    end
  end

  private
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end