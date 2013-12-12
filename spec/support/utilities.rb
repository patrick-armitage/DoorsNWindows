def full_title(page_title)
  base_title = "DoorsNWindows"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

def sign_in(user, options={})
  if options[:no_capybara]
    # Sign in when not using Capybara.
    remember_token = User.new_remember_token
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
  else
    visit signin_path
    fill_in "Email",    with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
  end
end

def lead_gen(lead)
  visit root_path
  fill_in "Name",  with: lead.name
  fill_in "Phone", with: lead.phone
  fill_in "Email", with: lead.email
  fill_in "Zip",   with: lead.zip
  choose lead.interest
  click_button "Free Quote"
end
