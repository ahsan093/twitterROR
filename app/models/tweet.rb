class Tweet < ApplicationRecord
    include Likeable
    belongs_to :user
    has_many :retweets
end
