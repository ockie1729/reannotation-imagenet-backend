require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with email and password" do
    user = User.new(
      email: 'hoge@example.com',
      password: 'hogehoge',
    )
    expect(user).to be_valid
  end
end
