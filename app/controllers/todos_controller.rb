class TodosController < ApplicationController
	def index
		render json: Todo.all 
	end

	def create
		@todo = Todo.create(todo_params)
		render json: @todo, status: 201
	end

	private 

	def todo_params
		params.require(:todo).permit(:title, :is_completed)
	end 
end
