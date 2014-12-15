# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.create(name: 'Allison')
# User.create(name: 'Zoe')
# User.create(name: 'Nicole')
# User.create(name: 'Simba')
# User.create(name: 'Frisky')
# User.create(name: 'Frisky2')
# User.create(name: 'Sumi')
#
# Question.create(title: "How does ruby on Rails work in space Boston? I\'m trapped in space Boston? I wasnt to be in space paris!!!!", description: 'I think you can tell what i mean by the titlekjsaklfjlskjflksjfljsdlfjasldfjlasjf;sdj;fjdskfjs;dfj;sdljf;asdjflkdsjf;ldskfsafk;sj;fljsal;dfjl;asdjflksdjflaksjf;', user_id: 1)
# Question.create(title: "How does ruby on Rails work in Boston? I\'m trapped in Boston? I wasnt to be in space paris!!!!", description: 'I think you can tell what i mean by the titlekjsaklfjlskjflksjfljsdlfjasldfjlasjf;sdj;fjdskfjs;dfj;sdljf;asdjflkdsjf;ldskfsafk;sj;fljsal;dfjl;asdjflksdjflaksjf;', user_id: 1)

Answer.create(answer: "ruby on rails is written in reverse in space Boston.  Just when you thought you knew ruby it\'s a whole new world of ruby. this is a really long string", question_id: 7, user_id: 1)
Answer.create(answer: "ruby on rails is written in the sky in space boston.  Just when you thought you knew ruby it\'s a whole new world of ruby. this is an even longer string than the other string", question_id: 8, user_id: 4)


# t.text     "answer",      null: false
# t.integer  "question_id", null: false
# t.integer  "user_id",     null: false
