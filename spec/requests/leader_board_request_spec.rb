require 'rails_helper'

RSpec.describe "LeaderBoards", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/leader_board/index"
      expect(response).to have_http_status(:success)
    end
  end

end
