require "miro/version"
require "terrapin"
require "color"
require "tempfile"
require "open-uri"
require png_lib = "chunky_png" # Load the C extension oily_png unless jruby is the platform in use.

require "miro/dominant_colors"

module Miro
  class << self
    def options
      convert = `which convert`.strip
      @options ||= {
        :image_magick_path  => convert.length > 0 ? convert : '/usr/bin/convert',
        :resolution         => "150x150",
        :color_count        => 8,
        :quantize           => 'RGB',
        :method             => 'pixel_group'
      }
    end
    def pixel_group?
      options[:method] == 'pixel_group'
    end

    def histogram?
      options[:method] == 'histogram'
    end
  end
end
