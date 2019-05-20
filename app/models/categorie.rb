# frozen_string_literal: true

class Categorie < ApplicationRecord

  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }

end
