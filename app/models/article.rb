class Article < ApplicationRecord
	has_rich_text :content
	has_many :tags
	accepts_nested_attributes_for :tags
end
