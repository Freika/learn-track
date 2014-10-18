require 'rails_helper'

describe Knowledge, :type => :model do
  let(:knowledge) { create :knowledge }
  it "is valid" do
    expect(knowledge).to be_valid
  end

  it "is not valid if chosen wrong kind" do
    knowledge.kind = "something"
    expect(knowledge).not_to be_valid
  end

end
