require 'rails_helper'

RSpec.describe User, type: :model do
  subject {User.new(username: "Johan", email: "johan@faketestemail.com", password: "Password", password_confirmation: "Password")}
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a username" do
    subject.username=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a correctly formatted email address" do
    subject.email="johann"
    expect(subject).to_not be_valid
  end

end
