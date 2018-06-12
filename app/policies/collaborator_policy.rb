class CollaboratorPpolicy < ApplicationPolicy
    def create?
        return fals if user.blank?
        return (user.role == 'admin' || user.role == 'premium') && (record.wiki.user == user)
    end
end