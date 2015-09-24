require 'rails_helper'

RSpec.describe Moderator, type: :model do
  describe 'relations' do
  	it { should have_many(:posts).dependent(:destroy) }
  end

  describe 'validations' do
  	it { should validate_presence_of :fullname }
  	it { should validate_presence_of :username }
  	it { should validate_presence_of :password }
  end
end
