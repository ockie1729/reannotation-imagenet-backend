require 'rails_helper'

RSpec.describe AnnotationLabel, type: :model do
  it "is valid with explanation" do
    annotation_label = build(:annotation_label)

    expect(annotation_label).to be_valid
  end

  it "is invalid without explanation" do
    annotation_label = build(:annotation_label)
    annotation_label.explanation = nil

    expect(annotation_label).to be_invalid
  end
end
