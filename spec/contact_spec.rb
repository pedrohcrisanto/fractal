require 'rails_helper'

RSpec.describe Contact, elasticsearch: true, :type => :model do
  it 'should be indexed' do
     expect(Contact.__elasticsearch__.index_exists?).to be_truthy
  end
end