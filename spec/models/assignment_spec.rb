require 'rails_helper'

RSpec.describe Assignment, type: :model do
  it "is valid with user, image and competition" do
    assignment = build(:assignment)

    expect(assignment).to be_valid
  end

  it "is invalid without competition" do
    assignment = build(:assignment)
    assignment.competition = nil

    expect(assignment).to be_invalid
  end
end
