class NotificationsController < ApplicationController
  def index
    @notification = Notification.all
    puts @notification
  end
  
  def show
    @notification = Notification.find(params[:id])
  end
  
  def new
  end
  
  def create
    #render plain: params[:notification].inspect
    @notification = Notification.new(:title  => params[:title],:description => params[:text], :date => '03/06/2020')
    @notification.save
    #Notification.create!(:tabletitle, :description, :date)
    redirect_to notifications_path
  end
end
