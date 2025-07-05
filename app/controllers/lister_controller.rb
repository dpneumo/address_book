class ListerController < ApplicationController
  def list
    @people = Person.all
    write_list
  end

  def write_list
    File.open("tmp/addresses.txt", "w+") do |file|
      @people.all.each { |person| person2file(file, person) }
    end
  end

  def person2file(file, person)
    file.write person.fullname
    file.write person.street
    file.write person.label_csz
    file.write person.email
    file.write person.phone
    file.write person.pref_method
    file.write person.status
    file.write "\n\n"
  end
end
