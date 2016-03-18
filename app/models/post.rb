class Post < ActiveRecord::Base
  belongs_to :user

  # Area de validaciones
  validates :user_id, presence: true # Obligatoriamente, tiene que pertenecer a un User
  validates :type, presence: :true   # Obligatoriamente, tiene que tener un tipo de Post

end
