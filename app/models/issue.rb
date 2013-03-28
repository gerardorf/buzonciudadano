class Issue

  def initialize(properties)

    @text = properties[:text]
    @summary = properties[:summary]
    @fullname = properties[:fullname]
    @address = properties[:address]
    @images = properties[:images]

  end

  def to_hash

    { :identity => 'smthg',
      :text => @text,
      :summary => @summary,
      :fullname => @fullname,
      :address => @address,
      :images => @images
    }
  end

end