class AuthorizedController < ApplicationController
    before_action :set_current_restaurante
    before_action :authorize_member

    private

    def set_current_restaurante
        @restaurante = Restaurante.find(params[:restaurante_id])
    end 
    
    def authorize_member
        return redirect_to root_path, alert: 'No eres miembro de este Restaurante' unless @restaurante.users.include? current_user
    end 

end 