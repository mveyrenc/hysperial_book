class User < ApplicationRecord

  enum role: %w[noob reader contributor admin super_admin]
  after_initialize :set_default_role, :if => :new_record?
  translate_enum :role

  default_scope { order(:email) }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  def noob?
    role == 'noob'
  end

  def reader?
    role == 'reader'
  end

  def contributor?
    role == 'contributor'
  end

  def admin?
    role == 'admin'
  end

  def super_admin?
    role == 'super_admin'
  end

  def set_default_role
    self.role ||= 'noob'
  end

  def to_s
    email
  end
end
