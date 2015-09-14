require "spec_helper"

RSpec.describe TodosController, type: :controller do 
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
    context "with invalid params" do
      let(:invalid_params) { attributes_for(:todo, title: nil) }
      it "does not create a todo list" do
        post :create, todo: invalid_params, format: :json
        expect(response).to have_http_status(422)
        errors_json = JSON.parse(response.body)
        expect(errors_json["title"]).to include("can't be blank")
      end
    end
  end

  describe "PUT /update" do
    let(:todo) { create(:todo) }
    let(:new_params) { attributes_for(:todo, title: "Eat lunch") }
    it "allows you to edit a todo list" do
      todo
      put :update, id: todo.id, todo: new_params, format: :json
      expect(response).to have_http_status(:ok)
      todo_json = JSON.parse(response.body)
      expect(todo_json["title"]).to eq("Eat lunch")
    end
  end

  describe "DELETE /destroy" do
    let(:todo) { create(:todo) }
    it "deletes a todo list" do
      todo
      delete :destroy, id: todo.id
      expect(response).to have_http_status(:ok)
      expect(Todo.count).to eq(0)
    end
  end
end