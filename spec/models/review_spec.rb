require 'spec_helper'

describe Review do
  it { should belong_to :commentable }
  it { should belong_to :user }
end
