class Lancamento < ApplicationRecord
	belongs_to :user
	belongs_to :categoria
end
