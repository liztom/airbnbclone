require 'spec_helper'

describe User do

it { should have_many :reservations }
it { should have_many :listings }
it { should have_attached_file :avatar }
it { should validate_attachment_content_type(:avatar).
                allowing('image/png', 'image/gif').
                rejecting('text/plain', 'text/xml') }


end
