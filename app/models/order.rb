# frozen_string_literal: true

class Order < ApplicationRecord
  has_one    :purchase
  belongs_to :item
  belongs_to :user
end
