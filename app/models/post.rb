# frozen_string_literal: true

class Post < ApplicationRecord

  belongs_to :user

  validates :title,      presence: true, length: { maximum: 100 }
  validates :content,    presence: true

end
