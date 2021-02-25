require 'rails_helper'

RSpec.describe Competition, type: :model do
  it "is valid with starts_at and ends_at" do
    competition = build(:competition)
    competition.title = nil
    competition.explanation = nil

    expect(competition).to be_valid
  end

  it "is invalid without starts_at" do
    competition = build(:competition)
    competition.starts_at = nil

    expect(competition).to be_invalid
  end
end
