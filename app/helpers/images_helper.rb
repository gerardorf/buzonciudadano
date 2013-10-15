module ImagesHelper
  include Cloudinary

  def upload_image
    image = Cloudinary::Uploader.upload(encrypted_image)
    image["url"]
  end

  private

  def encrypted_image
    "data:image/" + extension + ";base64," + Base64.encode64(request.body.read)
  end

  def extension
    filename = params[:qqfile]
    assert_valid_filename(filename)
    filename.split('.').last
  end

  def assert_valid_filename(filename)
    raise "invalid image" if filename.nil?
  end
end
