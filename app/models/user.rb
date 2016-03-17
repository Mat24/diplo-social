class User < ActiveRecord::Base
  has_many :subscriptions, foreign_key: :follower_id, dependent: :destroy
  has_many :leaders, through: :subscriptions

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
