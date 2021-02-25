require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with email and password" do
    user = build(:user)

    expect(user).to be_valid
  end

  it "is invalid without email" do
    user = build(:user)
    user.email = nil

    expect(user).to be_invalid
  end
end
