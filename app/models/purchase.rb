# frozen_string_literal: true

class Purchase < ApplicationRecord
  belongs_to :order
end
