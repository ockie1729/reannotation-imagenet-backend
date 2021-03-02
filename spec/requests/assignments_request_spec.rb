require 'rails_helper'

RSpec.describe "Assignments", type: :request do

  describe "GET /show" do
    it "returns http success" do
      user = create(:user)
      auth_token = sign_in_through_api(user)

      get "/assignments", headers: auth_token
      expect(response).to have_http_status(:success)
    end
  end

end
