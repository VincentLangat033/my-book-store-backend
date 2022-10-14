require 'rails_helper'

RSpec.describe Rating, type: :model do
  subject {Rating.new(user_id: @current_user, book_id: "3", rating: "5")}

  it "is not valid due to missing attributes" do
    expect(subject).to_not be_valid
  end
  it "is not valid without a rating" do
    subject.rating=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without rating between 1 and 5" do
    subject.rating="6"
    expect(subject).to_not be_valid
  end
  it "is not valid without a book_id" do
    subject.book_id=nil
    expect(subject).to_not be_valid
  end
end
