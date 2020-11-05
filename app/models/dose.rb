class Dose < ApplicationRecord
  # Associations
  belongs_to :cocktail
  belongs_to :ingredient
  # Validation
  validates :description, :ingredient, :cocktail, presence: true
  validates_uniqueness_of :cocktail, scope: :ingredient
end
