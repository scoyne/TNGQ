class CollaboratorsController < ApplicationController
    before_action :set_wiki

    def new
       @collaborator = Collaborator.new
    end

    def create
        @collaborator = Collaborator.new(wiki_id: @wiki_id, user_id: params[:user_id])
        
        if @collaborator.save
            flash[:notice] = "Collaborator added successfuly."
            redirect_to edit_wiki_path(@collaborator.wiki)
        else
            flash[:alert] = "Something went wrong. An error occured while updating Wiki."
            redirect_to :new
        end
    end

    def destroy
        @collaborator = Collaborator.find(params[:id])

        if @collaborator.destroy
            flash[:notice] = "\"#{collaborator.user.email}\" is no longer collaborating."
            redirect_to @wiki
        else
            flash[:alert] = "Something went wrong. Collaborator was not deleted."
            render :show
        end
    end


    private
    def set_wiki
        @wiki = Wiki.find(params[:wiki_id])
    end
 end