require 'spec_helper'

describe Listing do
  it { should have_many :photos }
  it { should have_many :reviews }
  it { should belong_to :user }
  it { should have_many :reservations }
end
