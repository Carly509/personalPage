require 'test_helper'

class DirectMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @direct_message = direct_messages(:one)
  end

  test "should get index" do
    get direct_messages_url
    assert_response :success
  end

  test "should get new" do
    get new_direct_message_url
    assert_response :success
  end

  test "should create direct_message" do
    assert_difference('DirectMessage.count') do
      post direct_messages_url, params: { direct_message: { dm: @direct_message.dm, mail: @direct_message.mail, name: @direct_message.name, subject: @direct_message.subject } }
    end

    assert_redirected_to direct_message_url(DirectMessage.last)
  end

  test "should show direct_message" do
    get direct_message_url(@direct_message)
    assert_response :success
  end

  test "should get edit" do
    get edit_direct_message_url(@direct_message)
    assert_response :success
  end

  test "should update direct_message" do
    patch direct_message_url(@direct_message), params: { direct_message: { dm: @direct_message.dm, mail: @direct_message.mail, name: @direct_message.name, subject: @direct_message.subject } }
    assert_redirected_to direct_message_url(@direct_message)
  end

  test "should destroy direct_message" do
    assert_difference('DirectMessage.count', -1) do
      delete direct_message_url(@direct_message)
    end

    assert_redirected_to direct_messages_url
  end
end
