class ConfirmationsController < Devise::ConfirmationsController
 
    private
        def after_confirmation_path_for(resource_name, resource)
            sign_in(resource)
            # Change the status if user was invited to aceptado (Date/time)
            pages_dashboard_path
        end

end           