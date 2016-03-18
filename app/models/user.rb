class User < ActiveRecord::Base
  # Relaciones para suscripciones (Sacar que usuarios sigue un usuario)
  has_many :subscriptions, foreign_key: :follower_id, dependent: :destroy
  has_many :leaders, through: :subscriptions

  # Relaciones reversas para suscripciones (Sacar seguidores de un usuario)
  has_many :reverse_subscriptions, class_name: 'Subscription', foreign_key: :leader_id, dependent: :destroy
  has_many :followers, through: :reverse_subscriptions

  # Relaciones para con los Posts y sus derivaciones
  has_many :posts, dependent: :destroy # Tengo muchos post, si elimino el user, elimino los posts asociados
  has_many :text_posts, dependent: :destroy # Tengo text_posts post, si elimino el user, elimino los text_posts asociados
  has_many :image_posts, dependent: :destroy # Tengo muchos image_posts, si elimino el user, elimino los image_posts asociados

  # Relacion con los comentarios
  has_many :comments

  # Metodo para saber si un usuario sigue a otro
  def following?(leader)
    leaders.include? leader
  end

  # Metodo para seguir a un usuario
  def follow!(leader)
    if leader != self and !following?(leader)
      leaders << leader
    end
  end


end
