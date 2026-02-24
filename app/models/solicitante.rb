class Solicitante < ApplicationRecord
    has_many :notas, dependent: :destroy
end
