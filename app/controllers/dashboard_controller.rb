class DashboardController < ApplicationController
  def index
    @group_tasks = GroupTask.recent_tasks(current_user)
  end

  def warmups
  end

  def homework
  end
end
