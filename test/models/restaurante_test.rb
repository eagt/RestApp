# == Schema Information
#
# Table name: restaurantes
#
#  id         :bigint           not null, primary key
#  NIT        :integer
#  VAT        :string
#  address_1  :string
#  address_2  :string
#  city       :string
#  country    :string
#  email      :string
#  mobile     :string
#  name       :string
#  post_code  :string
#  telephone  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class RestauranteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
