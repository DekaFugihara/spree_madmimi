## USER SUBSCRIPTION FORMS
Deface::Override.new(:virtual_path => "spree/shared/_user_form",
                     :name         => "madmimi_subscription_form_signup",
                     :insert_after => "[data-hook=subscription_form_account]",
                     :partial      => "spree/shared/user_subscription_form1")
