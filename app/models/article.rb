class Article < ApplicationRecord
	has_rich_text :content
	has_many :tags, dependent: :destroy
	accepts_nested_attributes_for :tags
end
