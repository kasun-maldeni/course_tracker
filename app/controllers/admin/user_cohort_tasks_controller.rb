class Admin::UserCohortTasksController < AdminController
  def edit
    @uct = UserCohortTask.includes(:feedbacks).where(id: params[:id]).order('feedbacks.created_at DESC').first
  end

  def update
    uct = UserCohortTask.find_by(id: params[:id])
    uct.complete = update_params[:complete]
    message = update_params[:feedbacks][:message]
    if message.present?
      uct.feedbacks.build(message: message, author: current_user)
    end
    uct.save
    redirect_to 'edit'
  end

  def update_params
    params[:user_cohort_task]
  end
end
