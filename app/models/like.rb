class Like < ApplicationRecord
  # belongs_to :activity
  belongs_to :user
  belongs_to :book
  delegate :title, to: :book, prefix: :book, allow_nil: true
end
