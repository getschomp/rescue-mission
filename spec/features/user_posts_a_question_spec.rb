require 'rails_helper'


feature "User posts a question." do
  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in_as(@user)
  end
  scenario "Clicks the post button and is redirected to form for creatin new questions." do
    click_link 'Post a Question'
    expect(page).to have_content 'Post a new Question'
    find_field('question_title')
    find_field('question_description')
  end
  scenario "Creates a question." do
    click_link 'Post a Question'
    title =  "a really awesome and really serious
    question that I'm using for a test. To short to short"
    question = "this is a test description
    something about space boston, something about
    space paris fun with descriptions Awesome! too short Intresting intrests"
    fill_in "question_title", with: "#{title}"
    fill_in "question_description", with: "#{question}"
    click_button('Create Question')
    expect(page).to have_content title
    expect(page).to have_content question
  end
  scenario "User sumbits a question thats too short" do
    visit new_question_path
    title =  "a really awesome"
    question = "this is a test description
    something about"
    fill_in "question_title", :with => title
    fill_in "question_description", :with => question
    click_button('Create Question')
    expect(page).to have_content "too short"
  end
end
