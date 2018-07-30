class PhoneSerializer < ActiveModel::Serializer
  attributes :id, :number

  belongs_to :contact , optional: true

end
