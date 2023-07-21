class User < ApplicationRecord

  enum role: [:noob, :reader, :contributor, :admin, :super_admin]
  after_initialize :set_default_role, :if => :new_record?
  translate_enum :role

  default_scope { order(:email) }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  def set_default_role
    self.role ||= :noob
  end

  def to_s
    email
  end
end
