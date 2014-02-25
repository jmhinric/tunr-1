require 'spec_helper'

describe Playlist do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:user) }

  # it { should belong_to(:user) }
  it { should have_many(:playlist_purchases) }
  it { should have_many(:purchases).through(:playlist_purchases) }
  it { should have_many(:songs).through(:purchases) }
  it { should have_many(:users).through(:playlist_users)}
end