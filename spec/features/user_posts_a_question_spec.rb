require 'rails_helper'

feature "user posts a question" do
  it "sees the page heading" do
    visit '/questions'
    expect(page).to have_content "SpaceOverflow"
  end
  it "sees the button" do
    visit '/questions'
    expect(page).to have_content "Post a Question"
  end
  it "sees all the questions on the page" do
    user = User.create(name: "Allison")
    question1 = Question.create!(title:"a really awesome and really serious
                                  question that I'm using for a test",
                                  description: "this is a test description
                                  something about space boston, something about
                                  space paris fun with descriptions Awesome!",
                                  user_id: user.id
                                  )
    question2 = Question.create!(title:"a really awesome and really serious
                                question that I'm using for a test",
                                description: "this is a test description
                                something about space boston, something about
                                space paris fun with descriptions Awesome!",
                                user_id: user.id )
    visit '/questions'
    expect(page).to have_content question1.title
    expect(page).to have_content question2.description
  end
end
