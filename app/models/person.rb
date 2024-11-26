# frozen_string_literal: true

class Person < ApplicationRecord
  has_many :addresses, -> { order(state: :asc, city: :asc, street: :asc, number: :asc) }

  validates :firstname, presence: true
  validates :lastname,  presence: true

  delegate  :fullname, :sortable_name, :informal_name, :formal_name, to: :person_name

  def self.select_collection
    order(:lastname, :firstname, :middlename).map {|p| [p.id.to_s + " " + p.sortable_name, p.id] }
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "firstname", "lastname", "middlename", "nickname", "note", "created_at", "updated_at"]
  end

  def person_name
    PersonName.new(firstname, middlename, lastname, nickname)
  end

  def birth_date
    Date.new(birthyear, birthmonth, birthday).to_s
  end

  def note_hint
    return '' unless note
    note.length > 15 ? note.slice(0..14)+'...' : note
  end
end
