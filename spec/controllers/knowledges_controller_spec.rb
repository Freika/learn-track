require 'rails_helper'

RSpec.describe KnowledgesController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

end
