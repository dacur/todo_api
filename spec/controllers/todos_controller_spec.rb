require "spec_helper"

RSpec.describe TodosController, type: :controller do 
	describe "GET /index" do
		let(:todo) { FactoryGirl.create :todo }
		it "returns a todo list" do
			get :index, format: :json
			expect(response).to have_http_status(:ok)
			todo_json = response_json["todos"]
			expect(todo_json["title"]).to eq("Buy groceries")
		end
	end

	
end