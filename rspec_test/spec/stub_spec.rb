describe "Stub" do
  class A; end
  class B < A; end
  before { allow_any_instance_of(A).to receive(:object_id) { 1 } }
  it { expect(A.new.object_id).to eq 1 }
  it { expect(B.new.object_id).to eq 1 }
end
