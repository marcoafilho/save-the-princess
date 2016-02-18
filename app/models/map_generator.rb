require 'open-uri'

# Access a Web Service that generates random maps
#
# Usage:
#   MapGenerator.new.save
#
# This will create a file in public/maps/m/500x500/#{random_number}.png
# By default, the map will be a 500x500 pixels Mercator map with a Lefebvre2
# color map.
class MapGenerator
  attr_reader :seed, :width, :height, :projection, :color_map

  SERVICE_HOST = 'topps.diku.dk'.freeze
  SERVICE_PATH = '/torbenm'.freeze
  DEFAULT_ATTRIBUTES = {
    width: 500, height: 500, projection: 'Mercator', color_map: 'Lefebvre2'
  }.freeze

  def initialize(attributes = {})
    initialize_attributes(attributes)
    initialize_seed
  end

  def save
    return true if File.exist?(full_path)
    File.open(full_path, 'w+') { |file| file.write(File.read(open(map_url))) }
  end

  def projection_id
    @projection_id ||= {
      'Mercator' => 'm',
      'Orthographic' => 'o'
    }[projection]
  end

  def color_map_id
    @color_map_id ||= {
      'Lefebvre2' => 'Lefebvre2.col'
    }[color_map]
  end

  def request_url
    URI::HTTP.build(host: SERVICE_HOST, path: SERVICE_PATH + '/maps.msp', query: query_hash.to_query)
  end

  def map_url
    path = Nokogiri::HTML(open(request_url)).css('img').attr('src').value
    URI::HTTP.build(host: SERVICE_HOST, path: SERVICE_PATH + "/#{path}")
  end

  def query_hash
    { seed: seed, width: width, height: height, projection: projection_id, colourmap: color_map_id }
  end

  def full_path
    FileUtils.mkdir_p Rails.root.join('public', save_path)
    @full_path ||= Rails.root.join('public', save_path, file_name)
  end

  def relative_path
    Pathname.new("/#{save_path}/#{file_name}")
  end

  def save_path
    Pathname("maps/#{projection_id}/#{width}x#{height}")
  end

  def file_name
    @file_name ||= "#{seed}.png"
  end

  private

  def initialize_attributes(attributes)
    attributes.reverse_merge(DEFAULT_ATTRIBUTES).each do |attribute, value|
      if DEFAULT_ATTRIBUTES.keys.include?(attribute)
        instance_variable_set("@#{attribute}", value)
      end
    end
  end

  def initialize_seed
    @seed = SecureRandom.random_number(99_999_999)
  end
end
