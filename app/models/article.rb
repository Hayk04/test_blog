class Article < ApplicationRecord
	has_rich_text :content
	has_many :tags, dependent: :destroy
	has_many :comments, dependent: :destroy
	accepts_nested_attributes_for :tags
	validates :headline, presence: true, length: { in: 3..30 }, uniqueness: true
	validates :content, presence: true, length: { minimum: 10 }
end
