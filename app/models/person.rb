# frozen_string_literal: true

STATEABBREV=%w( AL AK AS AZ AR CA CO CT DE DC FM FL GA GU HI ID IL IN IA KS KY LA ME MH MD MA MI MN MS MO MT NE NV NH NJ NM NY ND MP OH OK OR PW PA PR RI SC SD TN TX UT VT VI VA WA WV WI WY )

class Person < ApplicationRecord
#  before_validation :upcase_state

  validates :addressee, presence: true
  validates :street,  presence: true
  validates :city,  presence: true
  validates :state,  presence: true
  validates :state, inclusion: { in: STATEABBREV, message: "%{value} is not a valid state code" }
  validates :zip,  presence: true

  def upcase_state
    inter1 = state.upcase
    inter2 = inter1.strip if inter1
    state = inter2 if inter2
    state
  end

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
