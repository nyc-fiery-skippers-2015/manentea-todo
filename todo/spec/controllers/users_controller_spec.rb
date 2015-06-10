require 'rails_helper'

describe UsersController do

  context '#index' do

    it 'is successful' do
      get :index
      expect(response).to be_success
    end

    it 'assigns the all users to instance variable' do
      get :index
      expect(assigns(:users)).to eq(User.all)
    end
  end

  context '#show' do
    let(:user) {User.create(name: "Antonio", email: 'manentea', password: '12345')}

    it 'is successful' do
      get :show, :id => user.id
      expect(response).to be_success
    end

    it 'redirects to the correct user page' do
      get :show, :id => user.id
      expect(assigns(:user)).to eq user
    end
  end

  context '#new' do

    it 'is successful' do
      get :new
      expect(response).to be_success
    end

    it 'gets passed a new user' do
      get :new
      expect(assigns(:user)).to be_a_new User
    end

  end

  context '#create' do
    it 'creates a valid user' do
      expect {
        post :create, user: {name: "Antonio", email: 'manentea', password: '12345'}
      }.to change { User.count }.by(1)
    end
  end
end
