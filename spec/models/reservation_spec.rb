require 'spec_helper'
require 'pry'

describe Reservation do
  it { should have_many :reviews }
  it { should belong_to :user }
  it { should belong_to :listing }

end
