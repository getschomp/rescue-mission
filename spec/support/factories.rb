FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "#{n}email@email.com"}
    password "superspy"
    sign_in_count 0

    # answer
    # question
    #this will create me an answer and a question everytime i create a user
  end
end
#   factory :question do
#     title "This is the title of a question as an example. I'm not feeling creative right now."
#     description "fiyoth offlej uhxhsb iksmky blvypd jgsyta flyzel bglgfb yvqazk ahjcco dpirlk qhtyqb ezrvox gpufyn svhdaq yrnvzp pvshfc nvutco wxvvcc ydoewb vxjbja mttezr fvmayl uboadx sxlonu mcyovo mrmkqp "
#
#     user
#     has many answers
#   end
#   # create_table "questions", force: true do |t|
#   #   t.string   "title",       null: false
#   #   t.text     "description", null: false
#   #   t.integer  "user_id",     null: false
#   #   t.datetime "created_at"
#   #   t.datetime "updated_at"
#   # end
#
#   # validates :title,
#   # presence: true,
#   # length: {:minimum => 40}
#   #
#   # validates :description,
#   # presence: true,
#   # length: {:minimum => 150}
#
#   factory :answer do
#     sequence(:email) { |n| "#{n}email@email.com"}
#     encrypted_password "superspy"
#     sign_in_count 0
#
#     association :answer
#     question  #omg this is an association too whhhhaattt
#   end
# end
