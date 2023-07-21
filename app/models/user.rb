class User < ApplicationRecord

  enum role: [:noob, :reader, :contributor, :admin]
  after_initialize :set_default_role, :if => :new_record?

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
