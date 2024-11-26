# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :person

  validates :street1,   presence: true
  validates :street2,   presence: true
  validates :city,      presence: true
  validates :state,     presence: true
  validates :zip,       presence: true

  def primary
    preferred ? 'Yes' : ''
  end

  def complete_address
    "#{street1}, #{street2}, #{city}, #{state} #{zip}"
  end

  def complete_address_hint
    ca = complete_address
    ca.length > 20 ? ca.slice(0..19)+'...' : ca
  end

  def note_hint
    return '' unless note
    note.length > 20 ? note.slice(0..19)+'...' : note
  end
end
