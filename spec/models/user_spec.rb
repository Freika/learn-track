require 'rails_helper'

describe User, :type => :model do
  let(:admin) {create :admin}
  let(:user) {create :user}
  it "is valid admin with admin = true" do
    expect(admin.admin).to eq(true)
  end

  it "'s admin attribute is false" do
    expect(user.admin).to eq(false)
  end
end
