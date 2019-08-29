# encoding: utf-8

class ProductImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  def initialize(*)
    super
    CarrierWave.configure do |config| 
      config.permissions = 0644
      config.directory_permissions = 0755
      config.storage_engines = {
        :file => "CarrierWave::Storage::File",
        :fog  => "CarrierWave::Storage::Fog"
      }
      config.storage = :file
      config.cache_storage = nil
      config.fog_attributes = {}
      config.fog_credentials = {}
      config.fog_public = true
      config.fog_authenticated_url_expiration = 600
      config.fog_use_ssl_for_aws = true
      config.fog_aws_accelerate = false
      config.store_dir = 'uploads'
      config.cache_dir = 'uploads/tmp'
      config.delete_tmp_file_after_storage = true
      config.move_to_cache = false
      config.move_to_store = false
      config.remove_previously_stored_files_after_update = true
      config.downloader = CarrierWave::Downloader::Base
      config.ignore_integrity_errors = true
      config.ignore_processing_errors = true
      config.ignore_download_errors = true
      config.validate_integrity = true
      config.validate_processing = true
      config.validate_download = false
      config.root = lambda { CarrierWave.root }
      config.base_path = CarrierWave.base_path
      config.enable_processing = true
      config.ensure_multipart_form = true
    end
  end
  # include CarrierWave::MiniMagick
  
  # Choose what kind of storage to use for this uploader:
  
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :tiny do
    process resize_to_fit: [100, 100]
  end

  version :thumb do
    process resize_to_fit: [300, 300]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
