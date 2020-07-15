class ConfirmationController < Devise::ConfirmationsController

  private

  def after_confirmation_path_for(resource_name)
    sign_in(resource)
    welcome_path
  end

end