class Article < ApplicationRecord
	has_many :comments, dependent: :destroy
	validates :title, presence: true, length: { minimum: 1}
	validates :text, presence: true, length: {minimum: 1}
end
