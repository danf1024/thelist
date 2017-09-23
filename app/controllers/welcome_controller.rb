class WelcomeController < ApplicationController
  def index
    redirect_to invitations_path
  end
end
