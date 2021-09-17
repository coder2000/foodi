# == Schema Information
#
# Table name: units
#
#  id          :uuid             not null, primary key
#  description :text
#  name        :string
#  plural      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Unit < ApplicationRecord
end
