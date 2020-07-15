class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted? # if already the user is saved
      @user.remember_me = true # remember the user
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.auth'] = request.env['omniauth.auth'] # save a session if there is an error
      render :edit
    end
  end

  def sign_up_validation
    @user = User.from_omniauth(session['devise.auth'])
    if @user.update(user_params)
      sign_in_and_redirect @user, event: :authentication
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :name)
  end

end