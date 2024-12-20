require "application_system_test_case"

class PeopleTest < ApplicationSystemTestCase
  setup do
    @person = people(:one)
  end

  test "visiting the index" do
    visit people_url
    assert_selector "h1", text: "People"
  end

  test "should create person" do
    visit people_url
    click_on "New Person"

    fill_in "Addressee", with: @person.addressee
    fill_in "Lastname", with: @person.lastname
    fill_in "Street", with: @person.street
    fill_in "City", with: @person.city
    fill_in "State", with: @person.state
    fill_in "Zip", with: @person.zip
    fill_in "Note", with: @person.note
    click_on "Submit"

    assert_text "Person was successfully created"
    click_on "Back"
  end

  test "should update Person" do
    visit person_url(@person)
    click_on "Edit", match: :first

    fill_in "Addressee", with: @person.addressee
    fill_in "Lastname", with: @person.lastname
    fill_in "Street", with: @person.street
    fill_in "City", with: @person.city
    fill_in "State", with: @person.state
    fill_in "Zip", with: @person.zip
    fill_in "Note", with: @person.note
    click_on "Submit"

    assert_text "Person was successfully updated"
    click_on "Back"
  end

  test "should destroy Person" do
    visit person_url(@person)
    click_on "Delete", match: :first
    click_on "OK"

    assert_text "Person was successfully destroyed"
  end
end
