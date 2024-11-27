# frozen_string_literal: true

class Person < ApplicationRecord
  validates :addressee, presence: true
  validates :street,  presence: true
  validates :city,  presence: true
  validates :state,  presence: true
  validates :zip,  presence: true

  def complete_address
    "#{street}, #{city}, #{state} #{zip}"
  end

  def complete_address_hint
    ca = complete_address
    ca.length > 20 ? ca.slice(0..19)+'...' : ca
  end

  def address_label
    "#{addressee}\n#{street}\n#{city}, #{state}  #{zip}"
  end

  def note_hint
    return '' unless note
    note.length > 15 ? note.slice(0..14)+'...' : note
  end
end
