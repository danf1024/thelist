class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.present?
      flash[:notice] = "Sign in successful"
      sign_in_and_redirect @user, event: :authentication
    else
      flash[:error] = "Unable to sign in "
      redirect_to root_path
    end
  end

  def failure
    redirect_to root_path
  end
end
