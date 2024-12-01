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
      { addressee: person.addressee,
        street: person.street,
        csz: person.label_csz }
    end
  end
end