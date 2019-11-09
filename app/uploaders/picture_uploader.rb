class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def size_range
    1..10.megabytes
  end

  version :thumb do
    process resize_to_fit: [300, 3000]
  end

  def extension_whitelist
    %w(jpg jpeg png)
  end
end
