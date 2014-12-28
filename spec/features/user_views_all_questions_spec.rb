require 'rails_helper'

feature "Homepage content is displayed" do
  before(:each) do
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
    question1 = Question.create!(:title => "a really awesome and really serious question that I'm using for a test it needs to be so long it needs to be quite long", :description => "this is a test description something about space boston, something about space paris fun with descriptions Awesome! longer longer longerjjkhkhkhkhkjhkhkhkjhkjhkhkhkhkjhjkhjkhkjhkjhklhlkh longer",
    :user_id => @user.id)
    question2 = Question.create!(:title =>"a really awesome and really serious
    question that I'm using for a test. THIS QUESTION WAS CREATED LATER",
    description: "this is a test description
    something about space boston, something about
    space paris fun with descriptions Awesome! A SLIGHTLY DIFFRENT QUESTION",
    user_id: @user.id
    )
    visit questions_path
    expect(page).to have_content question1.title
    expect(page).to have_content question2.title
  end

  it "sees the description of the question" do
    question1 = Question.create!(title:"a really awesome and really serious
    question that I'm using for a test",
    description: "this is a test sdjfklsjf jdkfjslkjf  jkdsjfklsd jdslkfjklsdaf jdsklfjkldsjflksdjf ; jlksdajf description
    something about space boston, something about dkjfsalkdjfs fjsdfksd lkjfl ldjf kldslkfjkl jdsfkl lkdsjf d dsljf l kljfkl jvkldjflkd jldsf klfkl kl ak akldsjflkdsjfkl s jgkl
    space paris fun with descriptions Awesome!",
    user_id: @user.id
    )
    question2 = Question.create!(title:"a really awesome and really serious
    question that I'm using for a test. THIS QUESTION WAS CREATED LATER",
    description: "this is a test description
    something about space boston, something about sjalkfjlsdjflsjflksfj sdf dsklfjklsdfj lsdfj sdlfjdslkf sdkjfdsklfj kkjdsklfjslkdfjksd flkd jkdj fjflkdsjfkldsf dsjfldks lkdsjv dkjvlkdsfjlkasd
    space paris fun with descriptions jdfksajfd jsdkfljsflk sjfklsfjklsdf sdkljfldks fjkdsf sdklfjklds fdjfkld klvdjsfkl dslk kl dkjlks Awesome! A SLIGHTLY DIFFRENT QUESTION",
    user_id: @user.id
    )
    visit questions_path
    expect(page).to have_content question1.description
    expect(page).to have_content question2.description
  end
end
