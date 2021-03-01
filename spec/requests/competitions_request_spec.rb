require 'rails_helper'

RSpec.describe "Competitions", type: :request do
  describe "GET /next" do
    it "returns http success" do
      competition = create(:competition)

      user = create(:user)
      auth_tokens = sign_in_through_api(user)

      get "/competitions/next", headers: auth_tokens
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json["CompetitionName"]).to eq competition.title
    end
  end
end
