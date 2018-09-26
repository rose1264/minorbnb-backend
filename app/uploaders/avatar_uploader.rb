class AvatarUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    puts "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def round
      manipulate! do |img|
        img.format 'png'

        width = img[:width]-2
        radius = width/2

        mask = ::MiniMagick::Image.open img.path
        mask.format 'png'

        mask.combine_options do |m|
          m.alpha 'transparent'
          m.background 'none'
          m.fill 'white'
          m.draw 'roundrectangle 1,1,%s,%s,%s,%s' % [width, width, radius, radius]
        end

        overlay = ::MiniMagick::Image.open img.path
        overlay.format 'png'

        overlay.combine_options do |o|
          o.alpha 'transparent'
          o.background 'none'
          o.fill 'none'
          o.stroke 'white'
          o.strokewidth 2
          o.draw 'roundrectangle 1,1,%s,%s,%s,%s' % [width, width, radius, radius]
        end

        masked = img.composite(mask, 'png') do |i|
          i.alpha "set"
          i.compose 'DstIn'
        end

        masked.composite(overlay, 'png') do |i|
          i.compose 'Over'
        end
      end
    end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end
  process resize_to_fit: [400, 400]
  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_fit: [50, 50]
    process :round
  end

  version :demo do
    process resize_to_fit: [200, 200]
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
