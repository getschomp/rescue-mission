class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, dependent: :destroy

  validates_presence_of :user


  validates :title,
  presence: true,
  length: {:minimum => 40}

  validates :description,
  presence: true,
  length: {:minimum => 150}

end
