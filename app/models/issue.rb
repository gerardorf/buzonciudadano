require 'securerandom'

class Issue < 
  Struct.new(:text, :summary, :fullname, :address, :images, :email, :dni)

  def uuid
    @uuid ||= SecureRandom.uuid
    @uuid
  end

  def from_map(a_map)
    @text = a_map['text']
    @summary = a_map['summary']
    @fullname = a_map['fullname']
    @address = a_map['address']
    @images = a_map['images']
    @email = a_map['email']
    @dni = a_map['dni']
    @uuid = a_map['uuid']
    
    self
  end

end

class NullIssue < Issue

  def uuid
   ''
  end  

end
