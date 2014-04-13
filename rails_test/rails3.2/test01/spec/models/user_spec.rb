require 'spec_helper'

describe User do
  before do
    3.times.each do | i |
      user = create :user, name: "user#{i}", email: "user#{i}@example.com"
      create :item,  name: "item#{i}"
      user.items << Item.all.to_a
    end
  end

  it ".search" do
    expect(User.search(:name, "user0")).to eq [User.first]
  end
end
