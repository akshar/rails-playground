class TasksController < ApplicationController
  before_action :set_task , only: [:show , :update, :edit, :destroy]

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(tasks_params)
    response_to do |format|
      if @task.save
        format.html {redirect_to @task , notice "task was completed succesfully"}
        format.json {render :show, status: :created, location: @task}
      else
        format.html {render :new}
        format.json {render json: @task.errors, status: :unprocessable_entity}
      end
    end
  end

  def create
    response_to do |format|
      if @task.update(tasks_params)
        format.html {redirect_to @task , notice "task was updated succesfully"}
        format.json {render :show, status: :created, location: @task}
      else
        format.html {render :edit}
        format.json {render json: @task.errors, status: :unprocessable_entity}
      end
    end
  end

  def destory
    @task.destroy
        format.html {redirect_to project_url(@task.project_id) , notice "task was deleted succesfully"}
        format.json {render head :no_content}
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def tasks_params
    params.require(:task).permit(:title, :description, :project_id, :completed, :task_file)
  end
end
