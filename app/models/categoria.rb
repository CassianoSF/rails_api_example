class Categoria < ApplicationRecord
	belongs_to :user
	has_many :lancamentos
end
