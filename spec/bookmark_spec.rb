# frozen_string_literal: true

require './lib/bookmark'
require 'database_helpers'

describe Bookmark do
  describe '.all' do
    it 'allows a user to view their bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

       bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
       Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
       Bookmark.create(url: 'www.google.com', title: 'Google')

      # connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      # connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")
      # connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com');")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'

      # expect(bookmarks).to include 'http://www.makersacademy.com'
      # expect(bookmarks).to include 'http://www.google.com'
      # expect(bookmarks).to include 'http://www.destroyallsoftware.com'
    end
  end

  describe '.create' do
  it 'creates a new bookmark' do
    bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
    persisted_data = persisted_data(id: bookmark.id)

    expect(bookmark).to be_a Bookmark
    expect(bookmark.id).to eq persisted_data['id']
    expect(bookmark.title).to eq 'Test Bookmark'
    expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end
  end
end






  #     it 'creates a new bookmark' do
  #       Bookmark.create(url: 'www.guardian.co.uk', title: 'Guardian')
  #       expect(Bookmark.all).to include 'www.guardian.co.uk'
  #     end
  #   end
  # end
