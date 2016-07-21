# coding: utf-8
module Spree
  class Subscriber < ActiveRecord::Base
    self.table_name = "spree_newsletter_subscribers"
    validates :email, presence: true
    
    def subscribe(list = "Retroca")
    	mad_api.add_to_list(email, list, {
			  :first_name => self.nome,
			  :perfil => self.profile,
			  :utm_source => self.utm_source,
			  :utm_campaign => self.utm_campaign,
			  :utm_medium => self.utm_medium,
			  :utm_term => self.utm_term,
			  :ubdate => self.ubdate
			})
    end

    def unsubscribe(list = "Retroca")
    	mad_api.remove_from_list(self.email, list)
    end

    def unsubscribe_from_all
    	mad_api.remove_from_all_lists(self.email)
    end

    def memberships
    	lists = mad_api.memberships(self.email)["lists"]
    	if lists
    		lists["list"]
    	end
    end

    def is_subscribed?(list_name = "Retroca")
    	if memberships
    		response = false
    		self.memberships.each { |m| response = true if m["name"] == list_name}
    		response
    	else
    		false
    	end
    end

    private

    def mad_api
    	MadMimi.new(ENV['MAD_EMAIL'], ENV['MAD_APIKEY'])
    end
  end
end