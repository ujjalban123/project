class ActiveStorageController::BaseController < ApplicationController::Base
	before_action :count_method!

	 include ActiveStorage::SetCurrent

  protect_from_forgery with: :exception
  def count_method!
     ## check what the video you want to increment.
     # and increment number of seen in model via direct for queue it to backgroud worker
     content.plus_seen
     # do something more.

  end
end
