module ImagesHelper
  include Cloudinary
  
  def upload
    filename = params[:qqfile]
    extension =  get_extension(filename)
    enc_image = "data:image/" + extension + ";base64," + Base64.encode64(request.body.read)
    image = Cloudinary::Uploader.upload(enc_image)

    image["url"]
  end

  def get_extension(filename)
    filename.split('.').last
  end
end
