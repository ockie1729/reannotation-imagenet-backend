module AuthorizationSpecHelper
  def sign_in_through_api(user)
    post "/auth/sign_in/",
      params: { email: user.email, password: user.password },
      as: :json

    response.headers.slice('client', 'access-token', 'uid')
  end
end
