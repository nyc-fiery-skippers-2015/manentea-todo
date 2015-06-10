require 'rails_helper'

describe User do
  let(:good_user) {User.new(name: "Antonio", email: 'manentea', password: '12345')}
  let(:bad_user_email) {User.new(name: "Antonio", password: '12345')}
  let(:bad_user_name) {User.new(email: 'manentea', password: '12345')}

  it 'has a name' do
    expect(good_user.valid?).to be true
  end

  it 'has an email' do
    expect(bad_user_name.valid?).to be false
  end

  it 'has an email' do
    expect(bad_user_email.valid?).to be false
  end
end
