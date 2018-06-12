class WikiPolicy < ApplicationPolicy
    
    def initialize(user, wiki)
        super(user, wiki)
        @wiki = record
    end

    def index?
        true
    end

    def show?
        return record.public? if user.blank? # returning public wikis if no user is logged in or user is not a premium member.
        record.public? || (user.rolde == 'admin' || (user.role == 'premium')) # if wiki is public show to all membership levels including admins.
    end
    
    def update?
        user.admin? || wiki.try(:user) == user
    end

    def destroy?
        @user.admin? || wili.try(:user) == user
    end

    class Scope < Scope
        def reslove
            wikis = []
            return Wiki.visible_to(user) if user.blank?

            if user.role == 'admin' # admin users can see all wikis
                wikis = scope.all
            elsif user.rold == 'premium'
                all_wikis = scope.all
                all_wikis.each do |wiki|
                    if wiki.public? || wiki.user == user || wiki.users.include?(user)
                        wikis << wiki 
                    end
                end
            else
                all_wikis = scope.all
                wikis = []
                all_wikis.each do |wiki|
                    if wiki.public? || wiki.users.include?(user)
                        wikis << Wiki
                    end
                end
            end
            wikis
        end
    end
end