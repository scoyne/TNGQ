class CollaboratorsController < ApplicationController
    before_action :require_sign_in

    def new
        @wiki = Wiki.find(params[:wiki_id])
        @collaborator = @wiki.collaborators.new
        authorize @collaborator
    end

    def create
        @wiki = Wiki.find(params[:wiki_id])
        @collaborator = Collaborator.new(params.require(:collaborator).permit(:user_id))
        @collaborator.wiki = @wiki
        authorize @collaborator
        if @collaborator.save
            flash[:notice] = "Collaborator added successfuly."
            redirect_to edit_wiki_path(@collaborator.wiki)
        else
            flash[:alert] = "Something went wrong. An error occured while updating Wiki."
            redirect_to :new
        end
    end

    def destroy
        @wiki = Wiki.find(params[:wiki_id])
        @collaborator = Collaborator.find(params[:id])
        if @collaborator.destroy
            flash[:notice] = "\"#{collaborator.user.email}\" is no longer collaborating."
        else
            flash[:alert] = "Something went wrong. Collaborator was not deleted."
        end
        redirect to edit_wiki_path(@wiki)
    end
 end