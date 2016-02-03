## USER SUBSCRIPTION FORMS
Deface::Override.new(:virtual_path => "spree/shared/_user_form",
                     :name         => "madmimi_subscription_form_signup",
                     :insert_after => "[data-hook=subscription_form_account]",
                     :partial      => "spree/shared/user_subscription_form1")

## GUEST SUBSCRIPTION FORMS
Deface::Override.new(:virtual_path => "spree/shared/_landing_cadastro",
                     :name         => "madmimi_subscription_form_landing",
                     :insert_bottom => "[data-hook=subscription_form_radio]",
                     :partial      => "spree/shared/guest_subscription_form1")

Deface::Override.new(:virtual_path => "spree/home/newindex",
                     :name         => "madmimi_subscription_form_newhome",
                     :insert_bottom => "[data-hook=subscription_form_checkbox]",
                     :partial      => "spree/shared/guest_subscription_form2")

Deface::Override.new(:virtual_path => "spree/info/comofunciona",
                     :name         => "madmimi_subscription_form_comofunciona",
                     :insert_bottom => "[data-hook=subscription_form_checkbox]",
                     :partial      => "spree/shared/guest_subscription_form3")

# Deface::Override.new(:virtual_path => "spree/info/newsletter",
#                      :name         => "spree_chimpy_subscription_form_lightbox",
#                      :insert_bottom => "[data-hook=subscription_form]",
#                      :partial      => "spree/shared/guest_subscription")