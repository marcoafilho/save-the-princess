require 'rails_helper'

RSpec.describe Account, type: :model do
  subject(:account) { Fabricate(:account) }

  it { is_expected.to respond_to(:authenticate) }
end
