class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to @todo, notice: 'Your new TODO was saved'
    else
      redirect_to new_todo_path, notice: 'can\'t be blank'
    end
  end


  private

  def todo_params
    params.require(:todo).permit(:description)
  end
end