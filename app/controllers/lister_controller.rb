class ListerController < ApplicationController
  def list
    @people = Person.all
    write_list
  end

  def write_list
    File.open("addresses.txt", "w+") do |file|
      @people.all.each {|person| person2file(file, person) }
    end
  end

  def person2file(file, person)
    file.write person.addressee
    file.write person.street
    file.write person.city_state_zip
    file.write "\n\n"
  end
end