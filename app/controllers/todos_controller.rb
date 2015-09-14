class TodosController < ApplicationController
	def index
		render json: Todo.all 
	end

	def create
		@todo = Todo.new(todo_params)
		if @todo.save
			render json: @todo, status: 201
		else
			render json: @todo, status: 422
		end
	end

	def update
		@todo = Todo.find(params[:id])
		if @todo.update_attributes(todo_params)
			render json: @todo, status: :ok
		else
			render json: @todo, status: 422
		end
	end

	def destroy
		@todo = Todo.find(params[:id])
		if @todo.destroy
			render json: nil, status: :ok
		else
			render json: @todo, status: :error
		end
	end

	private 

	def todo_params
		params.require(:todo).permit(:title, :is_completed)
	end 
end
