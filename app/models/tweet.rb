class Tweet < ApplicationRecord
    include Likeable
    belongs_to :user
    has_many :retweets
    has_many :comments, dependent: :destroy
end
