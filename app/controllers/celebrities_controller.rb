class CelebritiesController < ApplicationController
  include SessionsHelper
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy

  def authenticate
    deny_access unless signed_in?
  end

  def deny_access
    store_location
    redirect_to signin_path, :notice => "Please sign in to access this page."
  end

  def create
    @celebrity  = current_user.celebrities.build(params[:celebrity])
    if @celebrity.save
      flash[:success] = "Your Hero is created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'pages/home'
    end
  end
  def destroy
    @celebrity.destroy
    redirect_back_or root_path
  end

  private

    def authorized_user
      @celebrity = Celebrity.find(params[:id])
      #redirect_to root_path unless current_user?(@celebrity.user)
    end
end
