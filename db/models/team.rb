# frozen_string_literal: true

require_relative './application_record'

class Team < ApplicationRecord
  has_many :players
  has_and_belongs_to_many :matches

  validates :name, presence: true, uniqueness: true
end
