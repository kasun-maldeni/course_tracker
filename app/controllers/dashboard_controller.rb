class DashboardController < ApplicationController
  def index
    @cohort_tasks = CohortTask.recent_tasks(current_user.cohorts.first.id)
  end

  def warmups
    @cohort_tasks = CohortTask.warmups(current_user)
  end

  def homework
    @cohort_tasks = CohortTask.homework(current_user)
  end

  def task_progress
    @uct = UserCohortTask.task_progress(params[:user_cohort_task_id])
    redirect_to root_path if @uct.user_id != current_user.id
  end
end
