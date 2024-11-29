class AveryController < ApplicationController
  def show_18160_page
  end

  def labels
    @people = Person.all
  end
end