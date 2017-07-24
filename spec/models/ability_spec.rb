require 'rails_helper'

describe User do
  it 'user is not admin' do
    expect(User.new.admin?).to be false
  end

end
