require 'rails_helper'

RSpec.describe "Assignments", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/assignments"
      expect(response).to have_http_status(:success)
    end
  end

end
