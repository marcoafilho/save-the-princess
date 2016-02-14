require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { Fabricate(:user) }

  it { is_expected.to respond_to(:authenticate) }
end
