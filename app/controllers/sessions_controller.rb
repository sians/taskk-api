class SessionsController < Devise::SessionsController
  private

  def respond_with(resource, _opts = {})
    json_response resource
  end

  def respond_to_on_destroy
    render_delete_success(meta: { status: 'OK', logout: true })
  end
end
