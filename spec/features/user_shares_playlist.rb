require 'spec_helper'

describe "a user can share a playlist" do
  let(:user) do 
    User.create!({
      email: "j@k.co",
      password: "jeff",
      password_confirmation: "jeff",
      first_name: "Jeff",
      last_name: "K",
      dob: Date.today,
      balance: 100.00
    }) 
  end

  let(:friend) do 
    User.create!({
      email: "friend@k.co",
      password: "jeff",
      password_confirmation: "jeff",
      first_name: "Friend",
      last_name: "K",
      dob: Date.today,
      balance: 100.00
    }) 
  end

  let(:not_friend) do 
    User.create!({
      email: "not_friend@k.co",
      password: "jeff",
      password_confirmation: "jeff",
      first_name: "Not Friend",
      last_name: "K",
      dob: Date.today,
      balance: 100.00
    }) 
  end

  let(:kesha) do
    Artist.create!({
      name: "Ke$ha",
      photo_url: "http://placekitten.com/g/200/200"
    })
  end

  let(:tick_tock) do
    Song.create!({
      title: "Tick Tock",
      price: 1.99,
      artist: kesha
    })
  end

  let(:purchase_tick_tock) { Purchase.create!(user: user, song: tick_tock) }

  let(:playlist) { Playlist.create!(title: "Mellow Tunes", user: user)}

  before do
    PlaylistPurchase.create!(playlist: playlist, purchase: purchase_tick_tock)  
  end

  it "is accessible by the user" do
    # Log in as user
    login(user)
    
    # Add User as shared
    visit user_path(user)
    # click_link "View Playlists"
    # visit user_playlists_path(user)
    click_link "Share Playlist"
    visit edit_user_path(playlist)
    select friend.first_name, from: "user_first_names"
    click_button "Add Friend"

    # Visit playlist show page
    visit playlist_path(playlist)

    # Expect user can view the page
    expect(page).to have_content "Mellow Tunes"

    # Log out user
    click_link "Log Out Jeff!"
  end

  it "is accessible by the friend" do
    # Log in as friend
    login(friend)

    # Visit playlist show page
    visit playlist_path(playlist)

    # Expect friend can view page
    expect(page).to have_content "Mellow Tunes"

    # Log out friend
    click_link "Log Out Friend!"
  end

  it "is not accessible by not_friend" do
    # Log in as not_friend
    login(not_friend)

    # Visit playlist show page
    visit playlist_path(playlist)

    # Expect not_friend cannot see
    expect(page).to have_content "Welcome to Tunr!"
  end

  def login(user)
    visit "/login"
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in!"
  end

end