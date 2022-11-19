# frozen_string_literal: true

class Book < ApplicationRecord
  has_rich_text :content
  has_one_attached :profile_image
  belongs_to :user
  has_many :borrow_histories

  validates :book_title, :description, :publish_date, presence: true
end
