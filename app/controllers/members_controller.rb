class MembersController < AuthorizedController

        before_action :set_authorised_inviter

    def index 
        @members = @restaurante.members.all        
    end
    
    def invite
        email = params[:email]
        role = params[:rte_role]
        return redirect_to restaurante_members_path(@restaurante), alert: "Ingresa un email" if email.blank?  

        user = User.find_by(email:) || User.invite!({ email:}, current_user)
        return redirect_to restaurante_members_path(@restaurante), alert: "Email #{email} es invalido" unless user.valid?

        user.members.find_or_create_by(restaurante: @restaurante, rte_role: role)
        # Send an email to let the user know they have been invited to become a memeber of a restaurante
        
        redirect_to restaurante_members_path(@restaurante), notice: "Usuario con email #{email} ha sido invitado!"      
    end 

    private

    def set_authorised_inviter
        return redirect_to root_path, alert: "Pagina solo para Administradores" unless current_user&.role == 'owner'
    end
end
