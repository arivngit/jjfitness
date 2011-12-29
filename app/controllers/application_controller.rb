class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale
=begin
	def set_locale
		I18n.locale = nil
		session[:locale] = params[:locale] if params[:locale]
		puts "#########################################################"
		puts session[:loacle].class
		#session[:locale].force_encoding('UTF-8')
		I18n.locale = session[:locale] || I18n.default_locale
	end
=end
	def set_locale
		I18n.locale= nil
		session[:locale] = params[:locale] if params[:locale]
		puts params[:locale]
		puts session[:locale]
		I18n.locale =  session[:locale] || I18n.default_locale
	end
  
  helper_method :current_user, :logged_in?
  
  protected
  
  def confirm_logged_in
    unless session[:current_user_id]
      flash[:notice] = "Please log in."
      redirect_to(:controller => 'account', :action => 'login')
      return false # halts the before_filter
    else
      return true
    end
  end
  
  def current_user
	  # Both session and user.find should be true and it returns User object
	  #else nil
      @_current_user ||= session[:current_user_id] && User.find(session[:current_user_id])
	  
    end

    def logged_in?
      !current_user.nil?
    end
    
end
