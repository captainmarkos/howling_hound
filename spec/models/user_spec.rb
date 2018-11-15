require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = create(:user)
  end

  it 'is valid with valid attributes' do
    expect(@user).to be_valid
  end

  it 'has a unique email' do
    user = create(:user, email: 'bob@gmail.com')
    expect(user).to be_valid
  end
end
