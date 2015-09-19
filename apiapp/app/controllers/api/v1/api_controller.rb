class Api::V1::ApiController < ActionController::Base
  before_filter :authenticate
  respond_to :json
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    render text: '401 Access Denied', status: :unauthorized
  end

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_not_found
     render json: { 'error': '404 Record Not Found'}, status: :not_found
  end

  def authenticate
    @current_user = nil

    authenticate_or_request_with_http_basic do |username, password|
      @current_user = User.find_by_username(username).try(:authenticate, password)
    end
  end

  def current_user
    @current_user
  end
  helper_method :current_user
end
