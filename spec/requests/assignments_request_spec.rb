require 'rails_helper'

RSpec.describe "Assignments", type: :request do

  describe "GET /assignment" do
    it "returns http success" do
      assignment = create(:assignment)
      user = assignment.user
      image = assignment.image
      auth_token = sign_in_through_api(user)

      get "/assignment", headers: auth_token
      expect(response).to have_http_status(:success)

      assignments = JSON.parse(response.body)
      expect(assignments.first['imageUrl']).to eq image.url
    end
  end

end
