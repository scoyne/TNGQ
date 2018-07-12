class WikisController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @wikis = policy_scope(Wiki)
#    @wikis = WikiPolicy::Scope.new(current_user, Wiki).resolve
  end
#
  def show
    @wiki = Wiki.find(params[:id])
    @users = User.find_by(id: params[:id])
    @collaborators = @wiki.collaborators
  end
#
  def new
    @wiki = Wiki.new
  end  
#
  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user
    if @wiki.save
      flash[:notice] = "Your Wiki '#{@wiki.title}' was successfully saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end 
  end
#
  def edit
    @wiki = Wiki.find(params[:id])
    @user = User.all
  end
#
  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)
    authorize @wiki
    if @wiki.save && (@wiki.user == current_user || current_user.admin? || current_user.premium? )
      flash[:notice] = "Your wiki was successfully updated."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error updating your wiki. Please try again."
      render :edit
    end  
  end
#
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

end