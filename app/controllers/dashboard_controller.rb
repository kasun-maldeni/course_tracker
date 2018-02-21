class DashboardController < ApplicationController
  def index
    @group_tasks = GroupTask.recent_tasks(current_user.group_id)
  end

  def warmups
    @group_tasks = GroupTask.warmups(current_user)
  end

  def homework
    @group_tasks = GroupTask.homework(current_user)
  end

  def task_progress
    @ugt = UserGroupTask.task_progress(params[:user_group_task_id])
    redirect_to root_path if @ugt.user_id != current_user.id
  end
end
