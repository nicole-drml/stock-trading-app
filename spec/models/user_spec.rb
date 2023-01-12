require 'rails_helper'

RSpec.describe User, type: :model do

  it "can run tests" do
    expect(false).to be(false)
  end

  it "sets the default role to trader" do
    user3 = users(:three)

    expect(user3.role).to eq 'trader'
  end

  it "sets the default status to approved" do
    user = User.create(first_name: 'Joe', last_name: 'Terns', email: 'joe@terns.com', password: 'password')

    expect(user.status).to eq 'approved'
  end
end
