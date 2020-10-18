class PanelsController < ApplicationController

  def index
    @panels = Panel.all.where(user: current_user)

    json_response(
      @panels,
      include_data: [:tasks]
      )
  end
end
