# frozen_string_literal: true

module Api
  class ApplicationController < ActionController::API
    before_action :authenticate_request
    attr_reader :current_api_user

    private

    def authenticate_request
      @current_api_user = AuthorizeApiRequest.call(request.headers).result
      render json: { error: 'Not Authorized' }, status: 401 unless @current_api_user
    end
  end
end
