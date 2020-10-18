class ApplicationController < ActionController::API
  def json_response(data, include_data: [], meta: {}, params: {}, status: :ok)
    options = {
      include: include_data,
      params: params,
      meta: meta
    }

    render(json: json_serializer(data).new(data, options), status: status)
  end

  def render_unauthorized!
    json_response(
      nil,
      meta: { status: 'KO', message: 'Authorization failed' },
      status: :unauthorized,
    )
  end

  def render_server_error!
    json_response(
      nil,
      meta: { status: 'KO', message: 'Something went wrong.' },
      status: :internal_server_error
    )
  end

  def render_not_found!
    json_response(
      nil,
      meta: { status: 'KO', message: 'The resource you are looking for does not exist' },
      status: :not_found,
    )
  end

  def render_delete_success(data: nil, meta: { status: 'OK', message: 'Resource has been deleted' })
    json_response(
      data,
      meta: meta,
      status: :ok,
    )
  end

  def render_unprocessable_entity!(errors)
    json_response(
      nil,
      meta: { status: :unprocessable_entity, message: serialize_errors(errors) },
      status: :unprocessable_entity,
    )
  end

  private

  def json_serializer(data)
    return EmptySerializer if data.nil?

    data_class_name = data.is_a?(Enumerable) ? data.klass.name : data.class.name

    "#{data_class_name}Serializer".constantize
  end

  def serialize_errors(errors)
    errors.messages
  end
end
