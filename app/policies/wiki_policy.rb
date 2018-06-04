class WikiPolicy < ApplicationPolicy
    attr_reader :user, :wiki
    
    def initialize(user, wiki)
        super(user, wiki)
        @wiki = record
    end

    def update?
        user.admin? || wiki.try(:user) == user
    end

 
end