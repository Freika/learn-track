require 'rails_helper'

describe Activity, type: :model do
  let(:activity) { create :activity }

  it 'is valid with correct data' do
    expect(activity).to be_valid
  end

end
