require 'test_helper'

class DocumentItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @document_item = document_items(:one)
  end

  test "should get index" do
    get document_items_url
    assert_response :success
  end

  test "should get new" do
    get new_document_item_url
    assert_response :success
  end

  test "should create document_item" do
    assert_difference('DocumentItem.count') do
      post document_items_url, params: { document_item: { content: @document_item.content, document_id: @document_item.document_id } }
    end

    assert_redirected_to document_item_url(DocumentItem.last)
  end

  test "should show document_item" do
    get document_item_url(@document_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_document_item_url(@document_item)
    assert_response :success
  end

  test "should update document_item" do
    patch document_item_url(@document_item), params: { document_item: { content: @document_item.content, document_id: @document_item.document_id } }
    assert_redirected_to document_item_url(@document_item)
  end

  test "should destroy document_item" do
    assert_difference('DocumentItem.count', -1) do
      delete document_item_url(@document_item)
    end

    assert_redirected_to document_items_url
  end
end
