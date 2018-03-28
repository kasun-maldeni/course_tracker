class Admin::CohortTasksController < AdminController
  def show
    @ct = CohortTask.joins(:task).includes(:task).where(id: params[:id]).first
    @uct = UserCohortTask.joins(:user).includes(:user).where(cohort_task_id: @ct.id)
  end
end
