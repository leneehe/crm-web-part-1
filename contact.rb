gem 'activerecord', '=4.2.10'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Contact < ActiveRecord::Base
  #automatically set up reader and writer methods through mini record
  field :first_name, as: :string
  field :last_name,  as: :string
  field :email,      as: :string
  field :note,       as: :text

  # This method should return all of the existing contacts
  # def self.all
  #   return @@contacts
  # end

  # This method should accept an id as an argument
  # and return the contact who has that id
  # def self.find(by_id)
  #   result = false
  #   @@contacts.each do |contact|
  #     if by_id == contact.id
  #       result = contact
  #     end
  #   end
  #   puts "Invalid entry" if result == false
  #   return result
  # end

  # a getter (*get* the value of an attribute) #
  # def email
  #   @email
  # end
  #
  # def id
  #   @id
  # end
  #
  # def first_name
  #   @first_name
  # end
  #
  # def last_name
  #   @last_name
  # end
  #
  # def note
  #   @note
  # end

  # a setter (*set* the value of an attribute) #
  # def note=(note)
  #   @note = note
  # end
  #
  # def first_name=(name)
  #   @first_name = name
  # end
  #
  # def last_name=(name)
  #   @last_name = name
  # end
  #
  # def email=(email)
  #   @email = email
  # end

  def full_name
    return "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  # def delete
  #   @@contacts.delete(self)
  # end

end

Contact.auto_upgrade!
at_exit do
  ActiveRecord::Base.connection.close
end
