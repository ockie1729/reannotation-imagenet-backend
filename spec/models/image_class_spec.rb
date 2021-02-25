require 'rails_helper'

RSpec.describe ImageClass, type: :model do
  it "is valid with synset" do
    image_class = ImageClass.new(
      synset: 'n000001'
    )
    expect(image_class).to be_valid
  end

  it "is invalid without synset" do
    image_class = ImageClass.new
    expect(image_class).to be_invalid
  end
end
