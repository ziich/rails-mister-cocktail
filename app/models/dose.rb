class Dose < ApplicationRecord
  has_many :ingredients
  belongs_to :ingredient
  belongs_to :cocktail

  validates :description, presence: true
  validates :cocktail, presence: true
  validates :ingredient, presence: true
  validates_uniqueness_of :cocktail_id, :scope => [:ingredient_id]
end
