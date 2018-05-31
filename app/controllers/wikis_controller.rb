class WikisController < ApplicationController
  before_action :authenticate_user!

  def index
    @wiki = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

def create
  @wiki = current_user.wikis.create(wiki_params)
  # @wiki = Wiki.new
  # @wiki.title = params[:wiki][:title]
  # @wiki.body = params[:wiki][:body]
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
    # @wiki.title = params[:wiki][:title]
    # @wiki.body = params[:wiki][:body] 
    authorize @wiki
    @wiki.assign_attributes(wiki_params)

    if @wiki.save
      redirect_to @wiki
    else
      render :edit
    end  
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    authorize @wiki

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
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
    unless current_user == wiki.user || current_user.admin?
      flash[:alert] = "You can only edit public wiki pages or your own wiki page."
      redirect_to [wiki, wiki]
    end
  end
end