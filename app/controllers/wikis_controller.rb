class WikisController < ApplicationController
  before_action :authenticate_user!

  def index
    @wiki = policy_scope(Wiki)
  end

  def show
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end  

  def create
    @wiki = Wiki.new(params.require(:wiki).permit(:title, :body, :private))
    @wiki.user = current_user
    authorize @wiki
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
  end

  def update
    @wiki = Wiki.find(params[:id])
    if @wiki.update_attributes(params.require(:wiki).permit(:title, :body))
      flash[:notice] = "Your wiki was successfully updated."]
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

  def authorize_user
    wiki = Wiki.find(params[:id])
    unless current_user.id == wiki.user.id || current_user.admin?
      flash[:alert] = "You can only edit public wiki pages or your own wiki page."
      redirect_to [wiki, wiki]
    end
  end
end