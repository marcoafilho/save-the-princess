require 'rails_helper'

RSpec.describe Account, type: :model do
  subject(:account) { Fabricate(:account) }

  it { is_expected.to respond_to(:authenticate) }

  describe '#avatar_url' do
    it { expect(subject.avatar_url).to eq('http://www.gravatar.com/avatar/40e9e6ac2a26038a5569729ef4c3e230') }
  end

  describe '#to_param' do
    it { expect(subject.to_param).to eq('hank') }
  end

  describe '#to_s' do
    describe 'without a name' do
      before(:each) do
        subject.name = ''
      end

      it { expect(subject.to_s).to eq('hank') }
    end

    it { expect(subject.to_s).to eq('Hank the Ranger') }
  end
end
