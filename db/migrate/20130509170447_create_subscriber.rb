class CreateSubscriber < ActiveRecord::Migration
  def change
    create_table :spree_newsletter_subscribers do |t|
      t.string :email, null: false
      t.boolean :subscribed, default: true
      t.string :nome
      t.string :profile
      t.string :utm_source
    	t.string :utm_medium
    	t.string :utm_campaign
      t.string :utm_term
    	t.datetime :ubdate
      t.timestamps
    end
  end
end
