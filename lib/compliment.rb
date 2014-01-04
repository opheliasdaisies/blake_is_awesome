class Compliment
  include DataMapper::Resource
  property :id, Serial
  property :description, Text, :required => true
  property :created_at, DateTime
  property :updated_at, DateTime
  
end