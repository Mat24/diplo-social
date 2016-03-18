class TextPost < Post

  # Area de validaciones
  validates :body, presence: true # Para un Post de tipo texto, obligatoriamente, tiene que tener un cuerpo de texto (body)

end
