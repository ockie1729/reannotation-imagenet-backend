require 'rails_helper'

RSpec.describe Image, type: :model do
  it "is valid with url and image" do
    image = build(:image)

    expect(image).to be_valid
  end
end
