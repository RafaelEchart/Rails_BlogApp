require 'rails_helper'
require 'capybara/rspec'

describe 'Sign In', type: :feature do
  context 'when successfull' do
    before :each do
      user = User.new(name: 'Rafaeñ', bio: "Rafael bio", email: 'email@test.com', password: '123456', confirmed_at: '2022-03-02 22:25:13.71382')
      user.save
    end

    it 'I can see the username and password inputs and the "Log in" button.' do
      visit 'users/sign_in'
      expect(page).to have_field('email')
      expect(page).to have_field('password')
      expect(page).to have_button('Log in')
      expect(page).to have_content('Log in')
    end

    it 'When I click the submit button without filling in the username and the password, I get a detailed error.' do
      visit 'users/sign_in'
      within('form') do
        fill_in 'email', with: ''
        fill_in 'password', with: ''
      end
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end

    it 'When I click the submit button after filling in the username and the password with incorrect data, I get a detailed error.' do
      visit 'users/sign_in'
      within('form') do
        fill_in 'email', with: 'incorrect@incorrect'
        fill_in 'password', with: 'incorrect'
      end
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end

    it 'When I click the submit button after filling in the username and the password with correct data, I am redirected to the root page.' do
      visit 'users/sign_in'
      within('form') do
        fill_in 'email', with: 'email@test.com'
        fill_in 'password', with: '123456'
      end
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully.'
      expect(page).to have_content 'Welcome to your Blog App'
      expect(current_path).to eq root_path
    end
  end
end