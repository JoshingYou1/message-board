class ApplicationController < ActionController::Base
    helper_method :current_user
    around_action :set_time_zone, if: :current_user
    def current_user
      if session[:user_id]
        @current_user ||= User.find(session[:user_id])
      else
        @current_user = nil
      end
    end

    private

    def set_time_zone(&block)
      Time.use_zone(current_user.time_zone, &block)
    end
end
