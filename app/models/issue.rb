require 'securerandom'

class Issue < Struct.new(:text, :summary, :fullname, :address, :images, :email, :dni)

    def uuid
        SecureRandom.uuid
    end

end