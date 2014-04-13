require 'spec_helper'

describe User do
  before do
    3.times.each do | i |
      user = create :user, name: "user#{i}", email: "user#{i}@example.com"
      create :item,  name: "item#{i}"
      user.items << Item.all.to_a
    end
  end

  context "raw" do
    it ".search name" do
      subject = User.search(:name, "user0")
      expect(subject.explain).to include "SELECT `users`.* FROM `users`  WHERE (`users`.`name` LIKE '%user0%')"
      expect(subject).to eq [User.first]
    end

    it ".search email" do
      subject = User.search(:email, "user0@example.com")
      expect(subject.explain).to include "SELECT `users`.* FROM `users`  WHERE (`users`.`email` LIKE '%user0@example.com%')"
      expect(subject).to eq [User.first]
    end
  end

  context "includes" do
    it ".search name" do
      subject = User.includes(:user_items).search(:name, "user0")
      expect(subject.explain).to include "SELECT `users`.* FROM `users`  WHERE (`users`.`name` LIKE '%user0%')"
      expect(subject).to eq [User.first]
    end

    it ".search includes email" do
      subject = User.includes(:user_items).search(:email, "user0@example.com")
      expect(subject.explain).to include "SELECT `users`.`id` AS t0_r0, `users`.`name` AS t0_r1, `users`.`email` AS t0_r2, `users`.`created_at` AS t0_r3, `users`.`updated_at` AS t0_r4, `user_items`.`id` AS t1_r0, `user_items`.`user_id` AS t1_r1, `user_items`.`item_id` AS t1_r2, `user_items`.`number` AS t1_r3, `user_items`.`created_at` AS t1_r4, `user_items`.`updated_at` AS t1_r5 FROM `users` LEFT OUTER JOIN `user_items` ON `user_items`.`user_id` = `users`.`id` WHERE (`users`.`email` LIKE '%user0@example.com%')"
      expect(subject).to eq [User.first]
    end
  end
end
