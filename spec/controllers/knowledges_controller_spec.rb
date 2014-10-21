require 'rails_helper'

RSpec.describe KnowledgesController, :type => :controller do

  describe "PUT update" do
    let(:admin) {create :admin}
    it "updates knowledge" do
      sign_in admin
      @knowledge = create(:knowledge)
      put :update, id: @knowledge, knowledge: attributes_for(:knowledge, name: "Test")
      @knowledge.reload

      expect(@knowledge.name).to eq "Test"
    end
  end

  describe "GET index" do
    it "lists all existing knowledges" do
      get :index
      # Переписать так, чтобы отвечало названию спека
      expect(response.body).to render_template :index
    end
  end

end
