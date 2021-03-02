require 'rails_helper'

RSpec.describe "LeaderBoards", type: :request do

  describe "GET /index" do
    it "returns http success" do
      annotation = create(:annotation)
      user = annotation.user
      auth_token = sign_in_through_api(user)

      get "/leader_board", headers: auth_token
      expect(response).to have_http_status(:success)
    end
  end

end
