class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include ApplicationHelper

  def index
    febreze_light(google_sheet)
  end

end
