require "application_system_test_case"

class DirectMessagesTest < ApplicationSystemTestCase
  setup do
    @direct_message = direct_messages(:one)
  end

  test "visiting the index" do
    visit direct_messages_url
    assert_selector "h1", text: "Direct Messages"
  end

  test "creating a Direct message" do
    visit direct_messages_url
    click_on "New Direct Message"

    fill_in "Dm", with: @direct_message.dm
    fill_in "Mail", with: @direct_message.mail
    fill_in "Name", with: @direct_message.name
    fill_in "Subject", with: @direct_message.subject
    click_on "Create Direct message"

    assert_text "Direct message was successfully created"
    click_on "Back"
  end

  test "updating a Direct message" do
    visit direct_messages_url
    click_on "Edit", match: :first

    fill_in "Dm", with: @direct_message.dm
    fill_in "Mail", with: @direct_message.mail
    fill_in "Name", with: @direct_message.name
    fill_in "Subject", with: @direct_message.subject
    click_on "Update Direct message"

    assert_text "Direct message was successfully updated"
    click_on "Back"
  end

  test "destroying a Direct message" do
    visit direct_messages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Direct message was successfully destroyed"
  end
end
