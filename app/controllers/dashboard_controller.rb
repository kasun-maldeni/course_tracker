class DashboardController < ApplicationController
  def index
    @group_tasks = current_user.group.group_tasks.where('release_date > ?', 12.hours.ago).joins(:task).includes(:task)
  end

  def warmups
  end

  def homework
  end
end
