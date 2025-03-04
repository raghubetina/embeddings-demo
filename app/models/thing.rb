# == Schema Information
#
# Table name: things
#
#  id          :bigint           not null, primary key
#  description :text
#  embedding   :vector(1536)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Thing < ApplicationRecord
  has_neighbors :embedding
end
