class CollaboratorsController < ApplicationController
    before_action :set_wiki

    def new
       @collaborator = Collaborator.new
    end
#
    def create
        @user = User.find_by(email: params[:collaborator][:user])
        @wiki = Wiki.find(params[:wiki_id])
        collaborator = Collaborator.new(user: @user, wiki: @wiki)        
        if collaborator.save
            flash[:notice] = "Collaborator added successfuly."
        else
            flash[:alert] = "Something went wrong. An error occured while updating Wiki."
        end
        redirect_to edit_wiki_path(@wiki)
    end
#
    def destroy
        collaborator = Collaborator.find(params[:id])
        if collaborator.destroy
            flash[:notice] = "Collaborator has been removed from the Wiki."
        else
            flash[:alert] = "Something went wrong. Collaborator was not deleted."
        end
        redirect_to edit_wiki_path(@wiki)
    end
#
    private
    def set_wiki
        @wiki = Wiki.find(params[:wiki_id])
    end
 end