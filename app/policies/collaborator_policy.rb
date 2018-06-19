class CollaboratorPpolicy < ApplicationPolicy
    def create?
        user.present? && (record.user == user) && user.role?(:premium)
    end

    class Scope < Scope
        def resolve
            scope
        end
    end
end