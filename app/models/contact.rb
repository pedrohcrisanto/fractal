class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones
  has_one :address
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true


  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :name
    end
  end

end
