# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create]

   #GET /resource/sign_in
   def new
     super
   end

   #POST /resource/sign_in
   def create
     super
   end


   
   #DELETE /resource/sign_out
   def destroy
     super
   end

 protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  def after_sign_in_path_for(resource)
    root_path
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  private
  
  def customer_state
      customer = Customer.find_by(email: params[:customer][:email])
      return if customer.nil?
      return unless customer.valid_password?(params[:customer][:password])
      return if customer.is_active 
       redirect_to new_customer_registration_path unless customer.is_active
  end
  
end
