class AddSubscriptionDataToSpreeUsers < ActiveRecord::Migration
	def change
		change_table Spree.user_class.table_name.to_sym do |t|
			t.boolean :subscribed
			t.string :utm_term
			t.string :utm_source
  			t.string :utm_medium
  			t.string :utm_campaign
			t.string :profile
		end
	end
end
