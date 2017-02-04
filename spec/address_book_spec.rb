require_relative '../models/address_book.rb'

RSpec.describe AddressBook do

  describe "attributes" do
    let(:book) { AddressBook.new }

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

      expect(new_entry.name).to eq('Ada Lovelace')
      expect(new_entry.phone_number).to eq('010.012.1815')
      expect(new_entry.email).to eq('augusta.king@lovelace.com')
    end
  end

  describe "#remove_entry" do
    let(:book) { AddressBook.new }

    it "removes only one entry" do
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      book.add_entry('James Williams', '010.222.2456', 'james.williams@lovelace.com')
      book.remove_entry('James Williams', '010.222.2456', 'james.williams@lovelace.com')
      expect(book.entries.size).to eq(1)
    end

    it "removes the correct entry" do
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      book.add_entry('James Williams', '010.222.2456', 'james.williams@lovelace.com')
      book.remove_entry('James Williams', '010.222.2456', 'james.williams@lovelace.com')
      remaining_entry = book.entries[0]

      expect(remaining_entry.name).to eq('Ada Lovelace')
      expect(remaining_entry.phone_number).to eq('010.012.1815')
      expect(remaining_entry.email).to eq('augusta.king@lovelace.com')
    end
  end
end
