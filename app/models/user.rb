class User < ActiveRecord::Base
  # Relaciones para suscripciones (Sacar que usuarios sigue un usuario)
  has_many :subscriptions, foreign_key: :follower_id, dependent: :destroy
  has_many :leaders, through: :subscriptions

  # Relaciones reversas para suscripciones (Sacar seguidores de un usuario)
  has_many :reverse_subscriptions, class_name: 'Subscription', foreign_key: :leader_id, dependent: :destroy
  has_many :followers, through: :reverse_subscriptions

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
