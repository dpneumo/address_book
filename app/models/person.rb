# frozen_string_literal: true

class Person < ApplicationRecord
  include States

  before_validation :clean_data
  before_validation :titleize_data
  before_validation :upcase_state

  validates :addressee, :lastname, :street, :city, :state, :zip, presence: true
  validates :state, inclusion: { in: state_abbreviations, message: "%{value} is not a valid state code" }

  def fullname
    return "ERROR" unless addressee && lastname
    addressee + " " + lastname
  end

  def complete_address
    "#{street}, #{city}, #{state} #{zip}"
  end

  def complete_address_hint
    ca = complete_address
    ca.length > 20 ? ca.slice(0..19)+'...' : ca
  end

  def label_csz
    "#{city} #{state} #{zip}"
  end

  def note_hint
    return '' unless note
    note.length > 15 ? note.slice(0..14)+'...' : note
  end

  private
  def clean_data
    changed.each do |name|
      send("#{name}=", send(name).strip) if send(name).respond_to?(:strip)
    end
  end

  def titleize_data
    changed.each do |name|
      next if name == 'state'
      send("#{name}=", send(name).titleize) if send(name).respond_to?(:titleize)
    end
  end

  def upcase_state
    send(:state=, send(:state).upcase) if send(:state).respond_to?(:upcase)
  end
end
