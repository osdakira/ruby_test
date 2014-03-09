# -*- coding: utf-8 -*-
require_relative '../person'

describe Person do
  # it do
  #   expect(Person.new.my_class_constant).to eq "内部の定数だよ"
  # end

  # it do
  #   expect(Person.new.top_level_constant).to eq "トップの定数だよ"
  # end

  # it {expect(7.zero?).to eq true}
  # it {expect([1, 2, 3]).to respond_to(:take).with(1).argument}
  # it {expect([1, 2, 3]).to respond_to(:take)}
  # it {expect([1, 2, 3]).to respond_to(:take).with(2).arguments}

  it "should be a instance" do
    expect(Person.new){Person.new}.to be_a(Person)
  end

  # it "should be a instance" do
  #   expect{Person.new}.to be_a(Person)
  # end

  # it "should be a instance" do
  #   expect{Person.new}.to eq Person
  # end

  # it "should be a instance" do
  #   expect{Person.new}.to eql Person
  # end

  # it "should be a instance" do
  #   expect{Person.new}.to equal Person
  # end

  # it "should be " do
  #   person = Person.new
  #   expect{person}.to eq person
  # end

  # it "should be true" do
  #   expect{Person.new}.to be_true
  # end
end
