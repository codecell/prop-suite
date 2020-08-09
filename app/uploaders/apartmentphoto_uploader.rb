class ApartmentphotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_fit: [50, 50]
  end

  CarrierWave.configure do |config|
    config.cache_storage = :file
  end

  # A white list of extensions which are allowed to be uploaded.
  def extension_whitelist
    %w[jpg jpeg gif png]
  end

  def content_type_whitelist
    [%r{image/}]
  end
end
