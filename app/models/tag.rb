class Tag < ApplicationRecord
  belongs_to :article
  validates :tag_body, presence: true
end
