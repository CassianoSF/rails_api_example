class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User

  has_many :categorias
  has_many :lancamentos
end
