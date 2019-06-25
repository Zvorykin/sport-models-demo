# frozen_string_literal: true

require_relative './application_record'

class Metric < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
