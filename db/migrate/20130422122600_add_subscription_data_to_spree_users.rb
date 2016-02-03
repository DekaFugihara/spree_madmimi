class AddSubscribedToSpreeUsers < ActiveRecord::Migration
  def change
    change_table Spree.user_class.table_name.to_sym do |t|
			t.boolean :subscribed
			t.string :utm_term
      t.string :profile
    end
  end
end
