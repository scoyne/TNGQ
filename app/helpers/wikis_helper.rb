module WikisHelper
    def user_is_authorized_for_edit?
        current_user
    end

    def user_is_authorized_for_deletion?
        current_user && current_user_admin?
    end
end
