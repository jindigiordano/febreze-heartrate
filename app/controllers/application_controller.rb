class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include ApplicationHelper

  def index
    if google_sheet_evening
      febreze_light(google_sheet_evening)
    elsif google_sheet_morning
      febreze_light(google_sheet_morning)
    elsif google_sheet_night
      febreze_light(google_sheet_night)
    else
      febreze_light(nil)
    end
  end

end
