# coding: utf-8
require 'madmimi'

module Spree
  class MadmimiController < Spree::StoreController
	  before_filter :load_api
	  before_filter :retrieve_utm_cookies, only: [:subscribe]
	  layout "spree/layouts/blank"

	  def load_api
	    @mimi = MadMimi.new(ENV['MAD_EMAIL'], ENV['MAD_APIKEY'])
	  end

	  def subscribe
	  	@errors = []
	  	email = params[:email]
	  	if email.blank?
	  		@errors << "spree.madmimi.subscribe.blank_email"
	  	elsif email !~ /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
	  		@errors << "spree.madmimi.subscribe.email_invalid"
	  	else
	  		@subscriber = {
	  			:email => email,
	  			:nome => params[:nome],
	  			:profile => params[:user_type]
	  		}
		  	@mimi.add_to_list(email, 'Retroca Teste', {
				  :first_name => params[:nome],
				  :perfil => params[:user_type],
				  :utm_source => cookies[:utm_source],
				  :utm_campaign => cookies[:utm_campaign],
				  :utm_medium => cookies[:utm_medium],
				  :utm_term => cookies[:utm_term]
				})

				if params[:show_success_lightbox] == "false"
	        @show_success_lightbox = false
	        session[:return_user_to] = "/compre?from=landing_cadastro"
	      else
	      	@show_success_lightbox = true
	      end
	    end
	    
	    respond_to do |format|
	      format.js
	    end
	  end

	  def success
	    flash[:newsletter_subscription_tracking] = "nothing special"
	    respond_to do |format|
	      format.html
	    end
	  end

	  private

	  def retrieve_utm_cookies
	  	cookies.permanent[:utm_source] = cookies[:original_utm_source] if cookies[:original_utm_source]
	    cookies.permanent[:utm_campaign] = cookies[:original_utm_campaign] if cookies[:original_utm_campaign]
	    cookies.permanent[:utm_medium] = cookies[:original_utm_medium] if cookies[:original_utm_medium]
	    cookies.permanent[:utm_term] = cookies[:original_utm_term] if cookies[:original_utm_term]
	  end

	end
end
