require 'rails_helper'

describe User do

  context "testing validations" do

    it 'requires email address' do
      expect(User.new(first_name: "Joe", last_name: "Schmoe", email: nil)).not_to be_valid
    end
  end

end
