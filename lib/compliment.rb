class Compliment
  include DataMapper::Resource
  property :id, Serial
  property :description, Text, :required => true
  property :author, String
  property :created_at, DateTime
  property :updated_at, DateTime

  def format_casing(quote)
    
  end
end