# == Schema Information
#
# Table name: households
#
#  id             :uuid             not null, primary key
#  city           :string
#  name           :string
#  state          :string
#  street_address :string
#  subdomain      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Household < ApplicationRecord
  validates :name, :subdomain, :street_address, :state, :city, presence: true
  validates :subdomain, uniqueness: true, format: {with: /\A[a-z0-9\-]+\z/, message: "accepts only letters and dashes"}, length: {in: 2..40}, if: :subdomain_changed?
  validates :name, :subdomain, blacklist: true
end
