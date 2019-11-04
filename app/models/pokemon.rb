class Pokemon < ApplicationRecord
  belongs_to :trainer, optional: true
  validates :name, presence: true
  validates :name, uniqueness: true
end
