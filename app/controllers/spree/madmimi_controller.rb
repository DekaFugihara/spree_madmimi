# coding: utf-8
require 'madmimi'

module Spree
	class MadmimiController < Spree::StoreController
		# before_filter :load_api
		before_filter :retrieve_utm_cookies, only: [:subscribe]
		layout "spree/layouts/blank"

		# def load_api
		#	 @mimi = MadMimi.new(ENV['MAD_EMAIL'], ENV['MAD_APIKEY'])
		# end

		def subscribe
			@errors = []
			email = params[:subscriber][:email]
			params[:alert_lightbox] ||= true

			if email.blank?

				@errors << t("spree.madmimi.subscribe.blank_email")

			elsif email !~ /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i

				@errors << t("spree.madmimi.subscribe.email_invalid")

			else

				if params[:alert_lightbox] == "false"
					@alert_success = false
					session[:return_user_to] = root_url + "?from=landing_cadastro"
				else
					@alert_success = true
				end

				@subscriber = Spree::Subscriber.where(email:email).first
				unless @subscriber
					@subscriber = Spree::Subscriber.create(subscriber_parameters)
				end
				if @subscriber.is_subscribed?
					@errors << t("spree.madmimi.subscribe.already_subscribed")
				else
					@subscriber.subscribe
				end
			end
			
			respond_to do |format|
				format.js { render :layout => false }
			end
		end

		def success
			flash[:newsletter_subscription_tracking] = "nothing special"
			respond_to do |format|
				format.html
			end
		end

		private

		def subscriber_parameters
			params[:subscriber][:subscribed] = true
			params[:subscriber][:update] = Date.today
			params[:subscriber].permit(:email, :nome, :utm_source, :utm_medium, :utm_campaign, :utm_term, :profile, :ubdate, :subscribed)
		end

		def retrieve_utm_cookies
			cookies.permanent[:utm_source] = cookies[:original_utm_source] if cookies[:original_utm_source]
			cookies.permanent[:utm_campaign] = cookies[:original_utm_campaign] if cookies[:original_utm_campaign]
			cookies.permanent[:utm_medium] = cookies[:original_utm_medium] if cookies[:original_utm_medium]
			cookies.permanent[:utm_term] = cookies[:original_utm_term] if cookies[:original_utm_term]
		end

	end
end
