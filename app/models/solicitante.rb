class Solicitante < ApplicationRecord
    has_many :notas, dependent: :destroy

    belongs_to :user
end
