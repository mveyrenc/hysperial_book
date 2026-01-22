# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                                                 :uuid             not null, primary key
#  current_sign_in_at                                 :datetime
#  current_sign_in_ip                                 :string
#  email                                              :string           not null
#  encrypted_password                                 :string           not null
#  last_sign_in_at                                    :datetime
#  last_sign_in_ip                                    :string
#  metadata(A hash to store some data about the item) :jsonb            not null
#  name                                               :string           not null
#  remember_created_at                                :datetime
#  reset_password_sent_at                             :datetime
#  reset_password_token                               :string
#  role                                               :string           default("noob"), not null
#  sign_in_count                                      :integer          default(0), not null
#  created_at                                         :datetime         not null
#  updated_at                                         :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_role                  (role)
#
FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }
    role { UserRole::ROLES.sample }

    trait :super_admin do
      role { :super_admin }
    end
    trait :admin do
      role { :admin }
    end
    trait :contributor do
      role { :contributor }
    end
    trait :reader do
      role { :reader }
    end
    trait :noob do
      role { :noob }
    end
    #   ---
    # super_admin:
    #   email: "super_admin@hysperialbook.org"
    #   name: "Ryan S. Walker"
    #   encrypted_password: "password"
    #   role: "super_admin"
    #
    # admin:
    #   email: "admin@hysperialbook.org"
    #   name: "Josefine J. Campbell"
    #   encrypted_password: "password"
    #   role: "admin"
    #
    # contributor:
    #   email: "contributor@hysperialbook.org"
    #   name: "Carrie J. Anthony"
    #   encrypted_password: "password"
    #   role: "contributor"
    #
    # reader:
    #   email: "reader@hysperialbook.org"
    #   name: "Jerri L. Ash"
    #   encrypted_password: "password"
    #   role: "reader"
    #
    # noob:
    #   email: "noob@hysperialbook.org"
    #   name: "Dana K. Cottle"
    #   encrypted_password: "password"
    #   role: "noob"
  end
end
