module WikisHelper
    def user_is_authorized_for_creation?
        current_user || current_user_admin? || current_user.premium?
    end

    def user_is_authorized_for_edit?
        current_user
    end

    def user_is_authorized_for_deletion?
        current_user && (current_user == @wiki.user || current_user.admin?)
    end
end
