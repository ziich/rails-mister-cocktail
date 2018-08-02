class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :doses, :dependent => :restrict_with_error
  before_destroy :check_for_doses, prepend: false


private

  def check_for_doses
    if dose.count > 0
      errors[:base] << "cannot delete ingredient while dose exists"
      return false
    end
  end

end
