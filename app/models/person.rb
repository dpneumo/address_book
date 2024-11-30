# frozen_string_literal: true

STATEABBREV=%w( AL AK AS AZ AR CA CO CT DE DC FM FL GA GU HI ID IL IN IA KS KY LA ME MH MD MA MI MN MS MO MT NC NE NV NH NJ NM NY ND MP OH OK OR PW PA PR RI SC SD TN TX UT VT VI VA WA WV WI WY )

class Person < ApplicationRecord
  before_validation :titleize_addressee
  before_validation :titleize_street
  before_validation :titleize_city
  before_validation :upcase_state

  validates :addressee, presence: true
  validates :street,  presence: true
  validates :city,  presence: true
  validates :state,  presence: true
  validates :state, inclusion: { in: STATEABBREV, message: "%{value} is not a valid state code" }
  validates :zip,  presence: true

  def complete_address
    "#{street}, #{city}, #{state} #{zip}"
  end

  def complete_address_hint
    ca = complete_address
    ca.length > 20 ? ca.slice(0..19)+'...' : ca
  end

  def label_addressee
    addressee.slice(0..28)
  end

  def label_street
    street.slice(0..28)
  end

  def label_csz
    "#{city}, #{state}  #{zip}"
  end

  def note_hint
    return '' unless note
    note.length > 15 ? note.slice(0..14)+'...' : note
  end

  private
    def titleize_addressee
      inter1 = addressee.strip if addressee
      self.addressee = inter1 ? inter1.titleize : nil
    end

    def titleize_street
      inter1 = street.strip if street
      self.street = inter1 ? inter1.titleize : nil
    end

    def titleize_city
      inter1 = city.strip if city
      self.city = inter1 ? inter1.titleize : nil
    end

    def upcase_state
      inter1 = state.strip if state
      self.state = inter1 ? inter1.upcase : nil
    end
end
