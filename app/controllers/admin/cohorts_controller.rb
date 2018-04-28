class Admin::CohortsController < AdminController
  def index
    @cohorts = Cohort.all
  end

  def new
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.new(create_params)
    if @cohort.save
      params[:students].split("\r\n").each do |email|
        @cohort.create_student email
      end
      redirect_to admin_cohorts_path
    else
      @errors = @cohort.errors.full_messages
      render 'new'
    end
  end

  def show
    @cohort = Cohort.find_by({id: params[:id]})
    @cohort_tasks = CohortTask.joins(:task, :category).includes(:task, :category).where(cohort_id: @cohort.id).order(:id)
    @tasks = Task.pluck(:name, :id)
    @categories = CohortTaskCategory.pluck(:name, :id)
    @students = User.joins(:cohorts, :role, :user_cohort_tasks).includes(:user_cohort_tasks).where(cohorts: {id: @cohort.id}, roles: {name: 'student'}).order(:first_name, 'user_cohort_tasks.cohort_task_id')
  end

  def create_cohort_task
    ct = CohortTask.new(create_cohort_task_params)
    ct.release_date = params[:cohort_task][:release_date].in_time_zone("Melbourne")
    category_name = CohortTaskCategory.find_by(id: ct.category_id).name
    if category_name == "homework" || category_name == "test"
      user_ids = User.joins(:cohorts, :role).where(cohorts: {id: ct.cohort_id}, roles: {name: 'student'}).pluck(:id)
      user_ids.each do |id|
        ct.user_cohort_tasks.build user_id: id, complete: false
      end
    end
    if ct.save
      redirect_to 'show'
    end
  end

  private
  def create_params
    params.require(:cohort).permit(:name)
  end

  def create_cohort_task_params
    params.require(:cohort_task).permit(:cohort_id, :task_id, :category_id, :release_date)
  end
end
