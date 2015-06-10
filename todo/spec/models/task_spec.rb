require 'rails_helper'

describe Task do
  let(:good_task) { Task.new(content: 'hello', user_id: 1) }
  let(:bad_user_task) { Task.new(content: 'hello') }
  let(:bad_content_task) { Task.new(user_id: 1) }

  it 'this is a canary test' do
    expect(true).to be true
  end

  it 'should have content' do
    expect(bad_content_task.valid?).to be false
  end

  it 'should have a user_id' do
    expect(bad_user_task.valid?).to be false
  end

  it 'should have both a user_id and content' do
    expect(good_task.valid?).to be true
  end
end
