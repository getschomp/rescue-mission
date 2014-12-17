require 'rails_helper'

feature "questions are displayed" do
  user = User.create(name: "Allison")
  question1 = Question.create!(title:"a really awesome and really serious
                                question that I'm using for a test",
                              description: "this is a test description
                              something about space boston, something about
                              space paris fun with descriptions Awesome!",
                              user_id: user.id
  )
  question2 = Question.create!(title:"a really awesome and really serious
                              question that I'm using for a test. THIS QUESTION WAS CREATED LATER",
                              description: "this is a test description
                              something about space boston, something about
                              space paris fun with descriptions Awesome! A SLIGHTLY DIFFRENT QUESTION",
                              user_id: user.id
  )
  it "sees the page heading" do
    visit '/questions'
    expect(page).to have_content "SpaceOverflow"
  end

  it "sees the button" do
    visit '/questions'
    expect(page).to have_content "Post a Question"
  end

  it "sees the title of the question" do
    visit questions_path
    expect(page).to have_content question1.title
    expect(page).to have_content question2.title
  end

  it "sees the description of the question" do
    visit questions_path
    expect(page).to have_content question1.description
    expect(page).to have_content question2.description
  end
end


feature "user posts a question" do
  scenario "clicks the post button and is redirected to new" do
    visit questions_path
    click_link 'Post a Question'
    expect(page).to have_content 'Post a new Question'
    find_field('question_title')
    find_field('question_description')
  end
  scenario "creates a question" do
    visit new_question_path
    title =  "a really awesome and really serious
    question that I'm using for a test. To short to short"
    question = "this is a test description
    something about space boston, something about
    space paris fun with descriptions Awesome! too short Intresting intrests"
    fill_in "question_title", :with => title
    fill_in "question_description", :with => question
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
