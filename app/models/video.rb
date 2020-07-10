class Video < ApplicationRecord
	belongs_to :user

	acts_as_votable

	has_one_attached :clip

	validates :user, presence: true

	validates :clip, attached: true
end
