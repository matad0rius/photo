class ConfirmatioController < Devise::ConfirmationController

  private

  def after_confirmation_path_for(resource_name, resource_name)
    sign_in(resource)
    welcome_path
  end

end