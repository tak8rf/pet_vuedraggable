module FamiliesHelper
    def current_family
        @current_family ||= current_user.families.first
    end
end
