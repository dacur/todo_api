require "spec_helper"

RSpec.describe TodosController, type: :controller do 
	# subject(:todo) { create(:todo) }
	describe "GET /index" do
		let(:todo) { create(:todo) }
		it "returns a todo list" do
			todo
			get :index, format: :json
			expect(response).to have_http_status(:ok)
			todo_json = JSON.parse(response.body)
			expect(todo_json.first["title"]).to eq("Go shopping")
		end
	end

	describe "POST /create" do
		context "with valid params" do
			let(:valid_params) { attributes_for(:todo, title: "Go shopping") }
			it "creates a todo list" do
				post :create, todo: valid_params, format: :json
				expect(response).to have_http_status(:created)
				todo_json = JSON.parse(response.body)
				expect(todo_json["title"]).to eq("Go shopping")
			end
		end
	end

	
end