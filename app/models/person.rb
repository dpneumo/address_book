# frozen_string_literal: true

STATEABBREV=%w( AL AK AS AZ AR CA CO CT DE DC FM FL GA GU HI ID IL IN IA KS KY LA ME MH MD MA MI MN MS MO MT NC NE NV NH NJ NM NY ND MP OH OK OR PW PA PR RI SC SD TN TX UT VT VI VA WA WV WI WY )

class Person < ApplicationRecord
  before_validation :clean_data
  before_validation :titleize_data

  validates :addressee, :lastname, :street, :city, :state, :zip, presence: true
  validates :state, inclusion: { in: STATEABBREV, message: "%{value} is not a valid state code" }

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
      send("#{name}=", send(name).titleize) if send(name).respond_to?(:titleize)
    end
  end
end
