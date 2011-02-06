require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
end



# == Schema Information
#
# Table name: users
#
#  id                   :integer         not null, primary key
#  email                :string(255)     default(""), not null
#  encrypted_password   :string(128)     default(""), not null
#  reset_password_token :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer         default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  confirmation_token   :string(255)
#  confirmed_at         :datetime
#  confirmation_sent_at :datetime
#  authentication_token :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  full_name            :string(255)     not null
#  firm                 :string(255)
#  website              :string(255)
#  occupation           :string(255)
#  note                 :text
#  discourse_state      :string(255)
#  discourse_subject    :string(255)
#  price_confirm        :boolean         default(TRUE), not null
#  twitter              :string(255)
#  tel                  :string(255)
#  invest_money         :decimal(, )     default(0.0), not null
#  role                 :string(255)
#

