class Categorie < ApplicationRecord

  validates :name, precense: true, uniqueness: true, length: {maximum: 50}

end
