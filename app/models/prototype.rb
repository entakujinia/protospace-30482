class Prototype < ApplicationRecord
  validates :profile, presence: true
  validates :occupation, presence: true
  validates :position, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image
end
