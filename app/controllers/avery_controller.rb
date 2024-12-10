class AveryController < ApplicationController
  def labels
    @noheader = true
    @mylabels = label_data
  end

  def label_data
    people = Person.all
    people.map do |person|
      { fullname: person.fullname,
        street: person.street,
        csz: person.label_csz }
    end
  end
end