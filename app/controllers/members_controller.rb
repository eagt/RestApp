class MembersController < AuthorizedController

    def index 
        @members = @current_restaurante.members.all        
    end
    def invite
        email = params[:email]
        role = params[:rte_role]
        return redirect_to restaurante_members_path(@current_restaurante), alert: "Ingresa un email" if email.blank?  

        user = User.find_by(email:) || User.invite!({ email:}, current_user)
        return redirect_to restaurante_members_path(@current_restaurante), alert: "Email #{email} es invalido" unless user.valid?

        user.members.find_or_create_by(restaurante: @current_restaurante, rte_role: role)
        # Send an email to let the user know they have been invited to become a memeber of a restaurante
        
        redirect_to restaurante_members_path(@current_restaurante), notice: "Usuario con email #{email} ha sido invitado!"      
    end 
end
