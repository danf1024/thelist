class ApiController < ApplicationController
  respond_to :json

  prepend_before_action :return_json
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  private

  def return_json
    request.format = :json
  end
end
