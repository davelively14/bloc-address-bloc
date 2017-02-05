require_relative '../models/address_book.rb'

RSpec.describe AddressBook do
  let(:book) { AddressBook.new }

  def check_entry(entry, expected_name, expected_number, expected_email)
    expect(entry.name).to eq(expected_name)
    expect(entry.phone_number).to eq(expected_number)
    expect(entry.email).to eq(expected_email)
  end

  describe "attributes" do

    it "responds to entries" do
      expect(book).to respond_to(:entries)
    end

    it "initializes entries as an array" do
      expect(book.entries).to be_an(Array)
    end

    it "initializes entries as empty" do
      expect(book.entries.size).to eq(0)
    end
  end

  describe "#add_entry" do
    let(:book) do
      $book = AddressBook.new
      $book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
    end

    it "adds only one entry to the address book" do
      expect(book.entries.size).to eq(1)
    end

    it "adds the correct information to entries" do
      new_entry = book.entries[0]
      check_entry(new_entry, 'Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
    end
  end

  describe "#import_from_csv" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries.csv")
      book_size = book.entries.size

      expect(book_size).to eq(5)
    end

    it "imports the 1st entry" do
      book.import_from_csv("entries.csv")
      entry_one = book.entries[0]

      check_entry(entry_one, 'Bill', '555-555-4854', 'bill@blocmail.com')
    end

    it "imports the 2nd entry" do
      book.import_from_csv("entries.csv")
      entry_one = book.entries[1]

      check_entry(entry_one, 'Bob', '555-555-5415', 'bob@blocmail.com')
    end

    it "imports the 3rd entry" do
      book.import_from_csv("entries.csv")
      entry_one = book.entries[2]

      check_entry(entry_one, 'Joe', '555-555-3660', 'joe@blocmail.com')
    end

    it "imports the 4th entry" do
      book.import_from_csv("entries.csv")
      entry_one = book.entries[3]

      check_entry(entry_one, 'Sally', '555-555-4646', 'sally@blocmail.com')
    end

    it "imports the 5th entry" do
      book.import_from_csv("entries.csv")
      entry_one = book.entries[4]

      check_entry(entry_one, 'Sussie', '555-555-2036', 'sussie@blocmail.com')
    end

    it "imports the correct number of entries" do
      book.import_from_csv("entries_2.csv")
      book_size = book.entries.size

      expect(book_size).to eq(3)
    end

    it "imports the 1st entry" do
      book.import_from_csv("entries_2.csv")
      entry = book.entries[0]

      check_entry(entry, 'Dave', '555-555-1001', 'dave@blocmail.com')
    end

    it "imports the 2nd entry" do
      book.import_from_csv("entries_2.csv")
      entry = book.entries[1]

      check_entry(entry, 'Sarah', '555-555-1010', 'sarah@blocmail.com')
    end

    it "imports the 3rd entry" do
      book.import_from_csv("entries_2.csv")
      entry = book.entries[2]

      check_entry(entry, 'Scout', '555-555-1100', 'scout@blocmail.com')
    end
  end
end
