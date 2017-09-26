class ApiController < ApplicationController
  respond_to :json

  prepend_before_action :return_json
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  before_action :underscore_params!

  private

  def underscore_params!
    underscore_hash = -> (hash) do
      hash.transform_keys!(&:underscore)
      hash.each do |key, value|
        if value.is_a?(ActionController::Parameters)
          underscore_hash.call(value)
        elsif value.is_a?(Array)
          value.each do |item|
            next unless item.is_a?(ActionController::Parameters)
            underscore_hash.call(item)
          end
        end
      end
    end
    underscore_hash.call(params)
  end

  def return_json
    request.format = :json
  end
end
