class ImagePost < Post

  # Area de validaciones
  validates :url, presence: true # Para un Post de tipo imagen, obligatoriamente, tiene que tener una url

end
