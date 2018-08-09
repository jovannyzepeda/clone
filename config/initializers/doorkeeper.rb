Doorkeeper.configure do
  # Change the ORM that doorkeeper will use (needs plugins)
  orm :active_record

  resource_owner_from_credentials do |routes|
    #logica de doorkeeper
    user = User.find_by(username: params[:username])
    if user && user.is_valid_password?(params[:password])
      user
    end
  end
  use_refresh_token
end


Doorkeeper.configuration.token_grant_types << "password"