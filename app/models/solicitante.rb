class Solicitante < ApplicationRecord
  has_many :notas, dependent: :destroy
  belongs_to :user

  validates :nombre, presence: true
  validates :email, presence: true, uniqueness: { scope: :user_id }
end