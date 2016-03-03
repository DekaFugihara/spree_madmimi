# coding: utf-8
require 'madmimi'

module Spree
  class MadmimiController < Spree::StoreController
	  # before_filter :load_api
	  before_filter :retrieve_utm_cookies, only: [:subscribe]
	  layout "spree/layouts/blank"

	  # def load_api
	  #   @mimi = MadMimi.new(ENV['MAD_EMAIL'], ENV['MAD_APIKEY'])
	  # end

	  def subscribe
	  	@errors = []
	  	email = params[:subscriber][:email]

	  	if email.blank?

	  		@errors << t("spree.madmimi.subscribe.blank_email")

	  	elsif email !~ /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i

	  		@errors << t("spree.madmimi.subscribe.email_invalid")

	  	else

	  		if params[:show_success_lightbox] == "false"
	        @show_success_lightbox = false
	        session[:return_user_to] = root_url + "?from=landing_cadastro"
	      else
	      	@show_success_lightbox = true
	      end

	  		@subscriber = Spree::Subscriber.where(email:email).first_or_create
	  		if @show_success_lightbox && @subscriber.is_subscribed?
	  			@errors << t("spree.madmimi.subscribe.already_subscribed")
	  		else
		  		@subscriber.update_attributes(params[:subscriber])
		  		@subscriber.subscribed = true
		  		@subscriber.ubdate = Date.today

		  		if @subscriber.save
		  			@subscriber.subscribe
			  	end
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
