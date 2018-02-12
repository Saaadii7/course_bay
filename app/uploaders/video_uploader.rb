class VideoUploader < CarrierWave::Uploader::Base
  include CarrierWave::Video
  # process encode_video: [:mp4, resolution: "640x360",callbacks: { after_transcode: :set_success } ]
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    "/assets/fallback/" + [version_name, "default.png"].compact.join('_')
  end

end



# class VideoUploader < CarrierWave::Uploader::Base
#   require 'streamio-ffmpeg'
#   storage :file
  
#   # FFMPEG.ffmpeg_binary = '/usr/local/bin/ffmpeg'

#   def store_dir
#     "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
#   end
# end

# class Video
#   mount_uploader :file, VideoUploader

#   def set_success(format, opts)
#     self.success = true
#   end
# end