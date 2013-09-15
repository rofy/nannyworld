require 'spec_helper'


describe 'Sign up page' do
  
  it 'will have a sign out link if user successfully signed up' do
    user = FactoryGirl.attributes_for(:user)
    
    visit '/users/registration/sign_up'
    fill_in 'user_email', :with => user[:email]
    fill_in 'user_password', :with => user[:password]
    fill_in 'user_password_confirmation', :with => user[:password]
    click_on 'user_submit'  

    page.should have_content('Sign out')
  end
  
  it 'will have the email of the user  if user successfully signed up' do
    user = FactoryGirl.attributes_for(:user)
    
    visit '/users/registration/sign_up'
    fill_in 'user_email', :with => user[:email]
    fill_in 'user_password', :with => user[:password]
    fill_in 'user_password_confirmation', :with => user[:password]
    click_on 'user_submit'  

    page.should have_content( user[:email])
  end
  
  
  
 
end