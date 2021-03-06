require 'rails_helper'

RSpec.describe "User", type: :request do

  describe "POST /auth/sign_in" do
    it "returns http success" do
      user = create(:user)
      json_body = {email: user.email, password: user.password}

      post "/auth/sign_in", params: json_body
      expect(response).to have_http_status(:success)
    end
  end
end
