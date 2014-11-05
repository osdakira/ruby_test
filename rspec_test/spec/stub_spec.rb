describe "Stub" do
  class A
    def name
      self.class.name
    end
  end

  class B < A
    def name
      self.class.name
    end
  end

  describe "instance method" do
    before { allow_any_instance_of(A).to receive(:object_id) { 1 } }
    it { expect(A.new.object_id).to eq 1 }
    it { expect(B.new.object_id).to eq 1 }
  end

  describe "class method" do
    before { allow(A).to receive(:new) }
    it { expect(A.new).to be_nil }
    it { expect(B.new).to be_nil }
    it { expect(expect(B).to receive(:new).and_call_original).to be_a B }
  end
end
