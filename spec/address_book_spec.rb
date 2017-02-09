require_relative '../models/address_book.rb'

RSpec.describe AddressBook do
  let(:book) { AddressBook.new }

  def check_entry(entry, expected_name, expected_number, expected_email)
    expect(entry.name).to eq(expected_name)
    expect(entry.phone_number).to eq(expected_number)
    expect(entry.email).to eq(expected_email)
  end

  describe "attributes" do

    it "does not expose entries" do
      expect(book).to_not respond_to(:entries)
    end
  end

  describe "#get_entries" do
    it "initializes entries as an array" do
      expect(book.get_entries).to be_an(Array)
    end
  end

  describe "#count_entries" do
    it "initializes entries as empty" do
      expect(book.count_entries).to eq(0)
    end
  end

  describe "#get_entry" do
    it "get_entry on empty book returns nil" do
      expect(book.get_entry(0)).to be_nil
    end
  end

  describe "#add_entry" do
    it "adds only one entry to the address book" do
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expect(book.count_entries).to eq(1)
    end

    it "adds the correct information to entries" do
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      new_entry = book.get_entry(0)
      check_entry(new_entry, 'Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
    end
  end

  describe "#import_from_csv" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries.csv")
      book_size = book.count_entries

      expect(book_size).to eq(5)
    end

    it "imports the 1st entry" do
      book.import_from_csv("entries.csv")
      entry_one = book.get_entry(0)

      check_entry(entry_one, 'Bill', '555-555-4854', 'bill@blocmail.com')
    end

    it "imports the 2nd entry" do
      book.import_from_csv("entries.csv")
      entry_one = book.get_entry(1)

      check_entry(entry_one, 'Bob', '555-555-5415', 'bob@blocmail.com')
    end

    it "imports the 3rd entry" do
      book.import_from_csv("entries.csv")
      entry_one = book.get_entry(2)

      check_entry(entry_one, 'Joe', '555-555-3660', 'joe@blocmail.com')
    end

    it "imports the 4th entry" do
      book.import_from_csv("entries.csv")
      entry_one = book.get_entry(3)

      check_entry(entry_one, 'Sally', '555-555-4646', 'sally@blocmail.com')
    end

    it "imports the 5th entry" do
      book.import_from_csv("entries.csv")
      entry_one = book.get_entry(4)

      check_entry(entry_one, 'Sussie', '555-555-2036', 'sussie@blocmail.com')
    end
  end

  describe "#binary_search" do
    it "searches AddressBook for a non-existent entry" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Dan")
      expect(entry).to be_nil
    end

    it "searches AddressBook for Bill" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Bill")
      expect(entry).to be_a Entry
      check_entry(entry, 'Bill', '555-555-4854', 'bill@blocmail.com')
    end

    it "searches AddressBook for Bob" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Bob")
      expect(entry).to be_a Entry
      check_entry(entry, 'Bob', '555-555-5415', 'bob@blocmail.com')
    end

    it "searches AddressBook for Joe" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Joe")
      expect(entry).to be_a Entry
      check_entry(entry, 'Joe', '555-555-3660', 'joe@blocmail.com')
    end

    it "searches AddressBook for Sally" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Sally")
      expect(entry).to be_a Entry
      check_entry(entry, 'Sally', '555-555-4646', 'sally@blocmail.com')
    end

    it "searches AddressBook for Sussie" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Sussie")
      expect(entry).to be_a Entry
      check_entry(entry, 'Sussie', '555-555-2036', 'sussie@blocmail.com')
    end

    it "searches AddressBook for Billy" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Billy")
      expect(entry).to be_nil
    end
  end
end
