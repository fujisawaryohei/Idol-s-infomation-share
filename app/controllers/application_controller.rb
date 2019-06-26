require 'securerandom'
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception #CSRF
  include SessionsHelper
  include UsersHelper

  before_action :thread_search, :user_search

  def thread_search
    @thread_search = Threader.ransack(params[:q])
    @thread_result = @thread_search.result(distinct: true)
  end

  def user_search
    @user_search = User.ransack(params[:q])
    @user_result = @user_search.result(distinct: true)
  end
end
