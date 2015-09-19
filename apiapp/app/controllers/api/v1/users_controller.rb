class Api::V1::UsersController < Api::V1::ApiController
  def index
    respond_with(@users)
  end
end
