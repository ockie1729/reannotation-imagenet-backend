require 'rails_helper'

RSpec.describe "Assignments", type: :request do

  describe "GET /assignment" do
    it "returns http success" do
      assignment = create(:assignment)
      user = create(:user)
      image = assignment.image
      auth_token = sign_in_through_api(user)

      get "/assignment", headers: auth_token
      expect(response).to have_http_status(:success)

      assignments = JSON.parse(response.body)
      expect(assignments.first['imageUrl']).to eq image.url
    end
  end

  describe "POST /assignment" do
    it "returns http success and add new record" do
      assignment = create(:assignment)
      user = create(:user)
      annotation_label = create(:annotation_label)
      auth_token = sign_in_through_api(user)

      expect(Annotation.count).to eq(0)

      annotations = [{assignmentId: assignment.id, annotation: annotation_label.id}]
      post "/assignment", params: {annotations: annotations}, headers: auth_token
      expect(response).to have_http_status(:success)

      expect(Annotation.count).to eq(1)
    end
  end

end
