class WikiPolicy < ApplicationPolicy
    attr_reader :user, :wiki
    
    def initialize(user, wiki)
        @user = user
        @wiki = wiki
    end

    def update?
        @user.present? || @user.admin?
    end

    def destroy?
        @user.present? || @user.admin?
    end
end