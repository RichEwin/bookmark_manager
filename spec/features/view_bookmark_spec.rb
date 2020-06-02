# frozen_string_literal: true

feature 'viewing bookmarks' do
  scenario 'A user can view the bookmark manager' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end

  scenario 'A user can view their bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content 'www.bbc.co.uk'
    expect(page).to have_content 'www.skysports.co.uk'
    expect(page).to have_content 'https://makers.tech/'
  end
end
