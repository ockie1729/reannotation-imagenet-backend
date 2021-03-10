require 'rails_helper'

RSpec.describe "Assignments", type: :request do

  describe "GET /assignment" do
    it "returns http success and array if competition is running" do
      assignment = build(:assignment)
      competition = assignment.competition

      # 開催中のコンペが存在
      competition.starts_at = Time.current.advance(days: -1)
      competition.ends_at = Time.current.advance(days: 2)
      assignment.save!
      competition.save!

      user = create(:user)
      image = assignment.image
      auth_token = sign_in_through_api(user)
 
      get "/assignment", headers: auth_token
      expect(response).to have_http_status(:success)

      assignments = JSON.parse(response.body)
      expect(assignments.first['imageUrl']).to eq image.url

      expect(Assignment.find(assignment.id).user).to eq(user)
    end

    it "returns dict if competition is not running" do
      assignment = build(:assignment)

      # コンペは開催していない
      competition = assignment.competition
      competition.starts_at = Time.current.advance(days: 1)
      competition.ends_at = Time.current.advance(days: 2)
      assignment.save!
      competition.save!

      user = create(:user)
      auth_token = sign_in_through_api(user)

      get "/assignment", headers: auth_token

      expect(response).to have_http_status(:success)

      assignments = JSON.parse(response.body)
      expect(assignments["message"]).to eq 'no competition is running'
    end
  end

  describe "POST /assignment" do
    it "returns http success and add new record" do
      assignment = build(:assignment)

      # 開催中のコンペが存在
      competition = assignment.competition
      competition.starts_at = Time.current.advance(days: -1)
      competition.ends_at = Time.current.advance(days: 2)
      assignment.save!
      competition.save!

      user = create(:user)
      annotation_label = create(:annotation_label)
      auth_token = sign_in_through_api(user)

      expect(Annotation.count).to eq(0)

      annotations = [{assignmentId: assignment.id,
                      annotation: annotation_label.id}]
      post "/assignment",
           params: {annotations: annotations},
           headers: auth_token
      expect(response).to have_http_status(:success)

      expect(Annotation.count).to eq(1)
    end

    it "returns 200 but no record added if no competition is running" do
      assignment = build(:assignment)

      # 開催中のコンペはない
      competition = assignment.competition
      competition.starts_at = Time.current.advance(days: 1)
      competition.ends_at = Time.current.advance(days: 2)
      assignment.save!
      competition.save!

      user = create(:user)
      annotation_label = create(:annotation_label)
      auth_token = sign_in_through_api(user)

      expect(Annotation.count).to eq(0)

      annotations = [{assignmentId: assignment.id,
                      annotation: annotation_label.id}]
      post "/assignment",
           params: {annotations: annotations},
           headers: auth_token
      expect(response).to have_http_status(:success)

      expect(Annotation.count).to eq(0)
    end
  end
end
