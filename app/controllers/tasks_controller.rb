class TasksController < ApplicationController
  before_action :set_task, only: [:update, :destroy]

  def create
    create_service = Tasks::CreateService.new(task_params)

    if create_service.call
      json_response(create_service.task)
    else
      render_unprocessable_entity!(create_service.errors)
    end
  end

  def update
    return render_not_found! unless @task

    update_params = task_params.except(:user_id).merge(task: @task)
    update_service = Tasks::UpdateService.new(update_params)

    if update_service.call
      json_response(update_service.task)
    else
      render_unprocessable_entity!(update_service.errors)
    end
  end

  def destroy
    return render_not_found! unless @task

    destroy_service = Tasks::DestroyService.new(task: @task)

    if destroy_service.call
      render_delete_success(meta: { status: 'OK', message: 'task destroyed'})
    else
      render_unprocessable_entity!(destroy_service.errors)
    end

  end

  private

  def task_params
    params.require(:task).permit(
      :title,
      :complete,
      :completed_on,
      :archived,
      :user_id,
      :panel_id,
    )
  end

  def set_task
    @task = Task.where(id: params[:id]).first
  end
end
