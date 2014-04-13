require 'spec_helper'

describe User do
  let!(:user) { create :user, name: "user0", email: "user0@example.com" }

  context "raw" do
    it "like name" do
      subject = User.where("`name` LIKE ?", "%user0%")
      expect(subject.explain).to include "SELECT `users`.* FROM `users`  WHERE (`name` LIKE '%user0%')"
      expect(subject).to eq [user]
    end

    it "like email" do
      subject = User.where("`email` LIKE ?", "%user0@example.com%")
      expect(subject.explain).to include "SELECT `users`.* FROM `users`  WHERE (`email` LIKE '%user0@example.com%')"
      expect(subject).to eq [user]
    end
  end

  context "includes" do
    it "like includes name" do
      subject = User.includes(:user_items).where("`name` LIKE ?", "%user0%")
      expect(subject.explain).to include "SELECT `users`.* FROM `users`  WHERE (`name` LIKE '%user0%')"
      expect(subject).to eq [user]
    end

    it "like includes email" do
      subject = User.includes(:user_items).where("`email` LIKE ?", "%user0@example.com%")
      expect(subject.explain).to include "SELECT `users`.`id` AS t0_r0, `users`.`name` AS t0_r1, `users`.`email` AS t0_r2, `users`.`created_at` AS t0_r3, `users`.`updated_at` AS t0_r4, `user_items`.`id` AS t1_r0, `user_items`.`user_id` AS t1_r1, `user_items`.`item_id` AS t1_r2, `user_items`.`number` AS t1_r3, `user_items`.`created_at` AS t1_r4, `user_items`.`updated_at` AS t1_r5 FROM `users` LEFT OUTER JOIN `user_items` ON `user_items`.`user_id` = `users`.`id` WHERE (`email` LIKE '%user0@example.com%')"
      expect(subject).to eq [user]
    end

    it "like includes name" do
      subject = User.includes(:user_items).where("`name` LIKE ?", "%user0@example.com%")
      expect(subject.explain).to include "SELECT `users`.`id` AS t0_r0, `users`.`name` AS t0_r1, `users`.`email` AS t0_r2, `users`.`created_at` AS t0_r3, `users`.`updated_at` AS t0_r4, `user_items`.`id` AS t1_r0, `user_items`.`user_id` AS t1_r1, `user_items`.`item_id` AS t1_r2, `user_items`.`number` AS t1_r3, `user_items`.`created_at` AS t1_r4, `user_items`.`updated_at` AS t1_r5 FROM `users` LEFT OUTER JOIN `user_items` ON `user_items`.`user_id` = `users`.`id` WHERE (`name` LIKE '%user0@example.com%')"
      expect(subject).to eq []
    end
  end
end
