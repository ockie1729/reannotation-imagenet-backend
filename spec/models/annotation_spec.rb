require 'rails_helper'

RSpec.describe Annotation, type: :model do
  it "is valid with image, annotation_label, user and assignment" do
    annotation = build(:annotation)

    expect(annotation).to be_valid
  end
  
  it "is invalid without assignment" do
    annotation = build(:annotation)
    annotation.assignment = nil 

    expect(annotation).to be_invalid
  end
end
