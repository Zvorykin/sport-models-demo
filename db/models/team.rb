# frozen_string_literal: true

require_relative './application_record'

class Team < ApplicationRecord
  has_many :players
  belongs_to :match

  validates :name, presence: true, uniqueness: true
end
