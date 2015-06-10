require 'rails_helper'

describe User do
  let(:good_user) {User.new(name: "Antonio", email: 'manentea', password: '12345')}
  let(:bad_user_email) {User.new(name: "Antonio", password: '12345')}
  let(:bad_user_name) {User.new(email: 'manentea', password: '12345')}

  it 'this is a canary test' do
    expect(true).to be true
  end

  it 'has a name' do
    expect(good_user).to be_valid
  end

  it 'has an email' do
    expect(bad_user_name).to be_invalid
  end

  it 'has an email' do
    expect(bad_user_email).to be_invalid
  end
end
