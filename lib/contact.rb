class Contact

  @@list = []

  attr_accessor :first_name, :last_name, :phone_number, :email
  attr_reader :id

  def initialize(my_hash)
    @first_name = my_hash["first_name"]
    @last_name = my_hash["last_name"]
    @phone_number = my_hash["phone_number"]
    @email = my_hash["email"]
    @id = @@list.length + 1
  end

  def self.all()
    @@list
  end

  def save()
    @@list.push(self)
  end

  def self.search(id)
    search_id = id.to_i

    @@list.each do |contact|
      if search_id == contact.id
        return contact
      end
    end
  end
end
