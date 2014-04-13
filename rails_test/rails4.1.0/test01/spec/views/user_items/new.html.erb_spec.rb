require 'spec_helper'

describe "user_items/new" do
  before(:each) do
    assign(:user_item, stub_model(UserItem,
      :user => nil,
      :item => nil,
      :number => 1
    ).as_new_record)
  end

  it "renders new user_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_items_path, "post" do
      assert_select "input#user_item_user[name=?]", "user_item[user]"
      assert_select "input#user_item_item[name=?]", "user_item[item]"
      assert_select "input#user_item_number[name=?]", "user_item[number]"
    end
  end
end
