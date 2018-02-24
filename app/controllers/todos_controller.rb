class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]

  # GET /todos
  def index
    @todos = Todo.all
  end

  # GET /todos/1
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos
  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      redirect_to todos_path
    else
      render :new
    end
  end

  # PATCH/PUT /todos/1
  def update
    parse_status_param unless params[:todo][:status].is_a?(Integer)
    if @todo.update(todo_params)
      redirect_to todos_path
    else
      render :edit
    end
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy
    redirect_to todos_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    def parse_status_param
      params[:todo][:status] = params[:todo][:status].to_i
    end
    # Only allow a trusted parameter "white list" through.
    def todo_params
      params.require(:todo).permit(:title, :status)
    end
end
