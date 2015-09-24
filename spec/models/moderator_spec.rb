require 'rails_helper'

RSpec.describe Moderator, type: :model do
  describe 'relations' do
  	it { should have_many(:posts).dependent(:destroy) }
  end
end
