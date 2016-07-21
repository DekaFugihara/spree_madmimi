# coding: utf-8

Spree::User.class_eval do
	# attr_accessible :subscribed

	after_save  :edit_subscription

  def edit_subscription
  	if self.subscribed
  		subscriber = Spree::Subscriber.where(email:self.email).first_or_create

  		subscriber.nome ||= self.firstname
  		subscriber.subscribed = true
  		subscriber.utm_source ||= self.utm_source
  		subscriber.utm_medium ||= self.utm_medium
  		subscriber.utm_campaign ||= self.utm_campaign
  		subscriber.utm_term ||= self.utm_term
  		subscriber.profile = self.profile
  		subscriber.ubdate ||= Date.today

			if subscriber.save
				subscriber.subscribe
			else
				subscriber.update_column(:subscribed, false) if subscriber
			end
		else
			subscriber = Spree::Subscriber.where(email:self.email).first
			if subscriber
				subscriber.unsubscribe
			end
  	end
  end

  def delete_subscription
  	subscriber = Spree::Subscriber.where(email:self.email).first
  	if subscriber
  		subscriber.unsubscribe_from_all
  		subscriber.destroy
  	end
  end

end