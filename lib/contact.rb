class Contact

  @@list = []

  attr_accessor :first_name, :last_name, :phone_number, :email, :address
  attr_reader :id

  def initialize(my_hash)
    @first_name = my_hash["first_name"]
    @last_name = my_hash["last_name"]
    @phone_number = my_hash["phone_number"]
    @email = my_hash["email"]
    @id = @@list.length + 1
    @address = []
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

  def self.remove(id)
    @@list.map do |contact|
      if contact.id == id
        contact.first_name = ""
        contact.last_name = ""
        contact.phone_number = ""
        contact.email = ""
      end
    end
  end

  def self.address(id, street, zipcode, state)
    @@list.map do |contact|
      if contact.id == id
        contact.address = [street, zipcode, state]
      end
    end
  end

  def self.update(id, first, last, phone, email)
    @@list.map do |contact|
      if contact.id == id
        contact.first_name = first
        contact.last_name = last
        contact.phone_number = phone
        contact.email = email
      end
    end
  end      
end
