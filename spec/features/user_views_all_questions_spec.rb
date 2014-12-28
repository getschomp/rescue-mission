require 'rails_helper'

feature "Homepage content is displayed" do
  before(:each, :js => true) do
    @user = FactoryGirl.create(:user)
    sign_in_as(@user)
  end


  it "sees the page heading" do
    visit '/questions'
    expect(page).to have_content "SpaceOverflow"
  end

  it "sees the button" do
    visit '/questions'
    expect(page).to have_content "Post a Question"
  end

  it "sees the title of the question" do
    question1 = Question.create!(title:"a really awesome and really serious
    question that I'm using for a test",
    description: "this is a test description
    something about space boston, something about
    space paris fun with descriptions Awesome!",
    user_id: @user.id
    )
    question2 = Question.create!(title:"a really awesome and really serious
    question that I'm using for a test. THIS QUESTION WAS CREATED LATER",
    description: "this is a test description
    something about space boston, something about
    space paris fun with descriptions Awesome! A SLIGHTLY DIFFRENT QUESTION",
    user_id: @user.id
    )
    binding.pry
    visit questions_path
    expect(page).to have_content question1.title
    expect(page).to have_content question2.title
  end

  it "sees the description of the question" do
    question1 = Question.create!(title:"a really awesome and really serious
    question that I'm using for a test",
    description: "this is a test description
    something about space boston, something about
    space paris fun with descriptions Awesome!",
    user_id: @user.id
    )
    question2 = Question.create!(title:"a really awesome and really serious
    question that I'm using for a test. THIS QUESTION WAS CREATED LATER",
    description: "this is a test description
    something about space boston, something about
    space paris fun with descriptions Awesome! A SLIGHTLY DIFFRENT QUESTION",
    user_id: @user.id
    )
    visit questions_path
    expect(page).to have_content question1.description
    expect(page).to have_content question2.description
  end
end
