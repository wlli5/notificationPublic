class ApplicationController < ActionController::Base
    def create
        render plain: params[:notification].inspect
    end
end
