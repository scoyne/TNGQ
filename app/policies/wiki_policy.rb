class WikiPolicy < ApplicationPolicy

    def edit
    end

    def update
        @user_present?
    end

    class Scope < Scope
        def resolve
            scope
        end
    end
end