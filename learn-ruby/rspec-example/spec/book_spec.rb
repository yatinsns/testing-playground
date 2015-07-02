require 'spec_helper'

# parameter to describe explains what we are testing, this could be a string. But we are using class name.

describe Book do

# :each and :all
before :each do
  @book = Book.new "Title", "Author", :category
end

# Nested describe block to say we are describing actions of a specific method.
# Also "#new" as per ruby convention of mentioning methods.
describe "#new" do
  it "takes three parameters and returns a Book object" do
    # notice object.should do_something
    # or object.should_not do_something
    @book.should be_an_instance_of Book
  end
end

describe "#title" do
  it "returns the correct title" do
    @book.title.should eql "Title"
  end
end

describe "#author" do
  it "returns the correct author" do
    @book.author.should eql "Author"
  end
end 

describe "#category" do
  it "returns the correct category" do
    @book.category.should eql :category
  end
end

end
