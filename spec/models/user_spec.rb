require 'rails_helper'

describe User, :type => :model do
  let(:user) {create :user}
  it "is valid" do
    expect(user).to be_valid
  end
end
