class App::WelcomeController < ApplicationController
  def index
    redirect_to app_invitations_path
  end
end
