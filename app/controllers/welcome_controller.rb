class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  
  def index
    @wikis = Wiki.all
  end

  def about
  end
end
