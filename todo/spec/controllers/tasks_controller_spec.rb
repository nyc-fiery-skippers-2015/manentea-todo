require 'rails_helper'

describe TasksController do

  context '#new' do
    let(:user) {User.create(name: "Antonio", email: 'manentea', password: '12345')}
    let(:task) {Task.create(content: 'hello', user_id: 1)}
    it 'should be successful' do
      get :new, user_id: user.id
      expect(response).to be_success
    end

    it 'should assign a new task for the correct user' do
      get :new, user_id: user.id
      expect(assigns(:task)).to be_a_new Task
    end
  end

  context '#create' do
    let(:user) {User.create(name: "Antonio", email: 'manentea', password: '12345')}
    it 'creates a task with valid attributes' do
      expect {
        post :create, task: {content: 'hello'}, user_id: user.id
      }.to change { Task.count }.by(1)
      expect(response).to be_redirect
    end

    it 'should not create a task with invalid attributes' do
      expect {
        post :create, task: {content: ''}, user_id: user.id
      }.not_to change { Task.count }
      expect(response).not_to be_redirect
    end
  end

  context '#destroy' do
    let(:user) {User.create(name: "Antonio", email: 'manentea', password: '12345')}
    let!(:task) {Task.create(content: 'hello', user_id: 1)}
    it 'should delete the task' do
      expect {
        delete :destroy, {id: task.id, user_id: user.id}
      }.to change { Task.count }.by(-1)
    end
  end

end
