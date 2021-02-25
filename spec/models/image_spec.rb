require 'rails_helper'

RSpec.describe Image, type: :model do
  it "is valid with url and image" do
    image_class = ImageClass.new(
      synset: "n0001",
      name: "example",
    )
    image_class = Image.new(
      url: "https://example.com/images/example.png",
      image_class: image_class
    )

    expect(image_class).to be_valid
  end
end
