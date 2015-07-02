require 'spec_helper'

describe "Library Object" do
  before :all do
    lib_obj = [Book.new("Javascript: The Good Parts", "Douglas Crockford", :development), Book.new("Designing with Web standards", "Jeffery Zeldman", :design), Book.new("Javascript patterns", "Stoyan Stefanov", :development)]
    File.open "books.yml", "w" do |f|
      f.write YAML::dump lib_obj
    end
  end

  before :each do
    @lib = Library.new "books.yml"
  end

  describe "#new" do
    # Specify a context for tests inside it.
    context "with no parameters" do
      it "has no books" do
        lib = Library.new
        # This is same as lib.books.length.should == 0
        # lib.should have(0).books
        lib.books.length.should == 0
      end
    end
    context "with a yaml file parameter" do
      it "has five books" do
        # @lib.should have(3).books
        @lib.books.length.should == 3
      end
    end
  end

  it "returns all the books in a given category" do
    @lib.get_books_in_category(:development).length.should == 2
  end

  it "accepts new books" do
    @lib.add_book(Book.new("Designing for the Web", "Mark Boulton", :design))
    # puts "yatin", @lib.get_book("Designing for the Web").class.name
    @lib.get_book("Designing for the Web").should be_an_instance_of Book
  end

  it "saves the library" do
    books = @lib.books.map {|book| book.title}
    @lib.save
    lib2 = Library.new "books.yml"
    books2 = lib2.books.map {|book| book.title}
    books.should eql books2
  end
end
