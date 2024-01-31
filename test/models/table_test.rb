# == Schema Information
#
# Table name: tables
#
#  id             :bigint           not null, primary key
#  number         :string
#  status         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  restaurante_id :bigint           not null
#
# Indexes
#
#  index_tables_on_restaurante_id  (restaurante_id)
#
# Foreign Keys
#
#  fk_rails_...  (restaurante_id => restaurantes.id)
#
require "test_helper"

class TableTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
