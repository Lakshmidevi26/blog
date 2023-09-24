require 'rails_helper'

RSpec.describe Tag, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  context "when creating a tag " do
    let(:tag1) { build :tag }
    it "should be valid user with all attributes " do
      expect(tag1.valid?).to eq(true)
    end


    let(:tag2) { build :tag,name:nil }
    it 'not save if name = nil' do
      expect(tag2.save).to eq(false)
    end

  end

end
