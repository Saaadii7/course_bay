class VideoUploader < CarrierWave::Uploader::Base
  include CarrierWave::Video
  require 'streamio-ffmpeg'
  storage :file
  process encode_video: [:mp4, resolution: "640x360",callbacks: { after_transcode: :set_success } ]
  
  # FFMPEG.ffmpeg_binary = '/usr/local/bin/ffmpeg'

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end

# class Video
#   mount_uploader :file, VideoUploader

#   def set_success(format, opts)
#     self.success = true
#   end
# end