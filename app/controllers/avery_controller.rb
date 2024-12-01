class AveryController < ApplicationController
  def show_18160_page
  end

  def labels
    @noheader = true
    @mylabels = label_data
  end

  def label_data
    people = Person.all
    people.map do |person|
      { addressee: person.label_addressee,
        street: person.label_street,
        csz: person.label_csz }
    end
  end
end