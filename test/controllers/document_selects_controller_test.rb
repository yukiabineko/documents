require 'test_helper'

class DocumentSelectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @document_select = document_selects(:one)
  end

  test "should get index" do
    get document_selects_url
    assert_response :success
  end

  test "should get new" do
    get new_document_select_url
    assert_response :success
  end

  test "should create document_select" do
    assert_difference('DocumentSelect.count') do
      post document_selects_url, params: { document_select: { content: @document_select.content, document_item_id: @document_select.document_item_id, select_number: @document_select.select_number } }
    end

    assert_redirected_to document_select_url(DocumentSelect.last)
  end

  test "should show document_select" do
    get document_select_url(@document_select)
    assert_response :success
  end

  test "should get edit" do
    get edit_document_select_url(@document_select)
    assert_response :success
  end

  test "should update document_select" do
    patch document_select_url(@document_select), params: { document_select: { content: @document_select.content, document_item_id: @document_select.document_item_id, select_number: @document_select.select_number } }
    assert_redirected_to document_select_url(@document_select)
  end

  test "should destroy document_select" do
    assert_difference('DocumentSelect.count', -1) do
      delete document_select_url(@document_select)
    end

    assert_redirected_to document_selects_url
  end
end
