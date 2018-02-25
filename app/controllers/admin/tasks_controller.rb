class Admin::TasksController < AdminController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(create_params)
    if @task.save
      redirect_to admin_tasks_path
    else
      @errors = @task.errors.full_messages
      render 'new'
    end
  end

  private
  def create_params
    params.require(:task).permit(:name, :question_link, :solution_link)
  end
end
