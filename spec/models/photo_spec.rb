require 'spec_helper'

describe Photo do

it { should belong_to :listing }
it { should have_attached_file :picture }
it { should validate_attachment_content_type(:picture).
                allowing('image/png', 'image/gif').
                rejecting('text/plain', 'text/xml') }


end
