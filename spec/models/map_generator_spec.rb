require 'rails_helper'

RSpec.describe MapGenerator, type: :model do
  subject(:map_generator) { MapGenerator.new }

  it { is_expected.to respond_to(:seed) }
  it { is_expected.to respond_to(:width) }
  it { is_expected.to respond_to(:height) }
  it { is_expected.to respond_to(:projection) }
  it { is_expected.to respond_to(:color_map) }

  describe '#width' do
    it 'returns the value of the width' do
      expect(map_generator.width).to eq(500)
    end
  end

  describe '#height' do
    it 'returns the value of the height' do
      expect(map_generator.height).to eq(500)
    end
  end

  describe '#projection' do
    it 'returns Mercator' do
      expect(map_generator.projection).to eq('Mercator')
    end
  end

  describe '#color_map' do
    it 'returns Lefebvre2' do
      expect(map_generator.color_map).to eq('Lefebvre2')
    end
  end

  describe '#seed' do
    it 'returns a random number' do
      expect(map_generator.seed).to be_between(0, 99_999_999)
    end
  end

  describe '#query_hash' do
    it 'returns a hash with the query params' do
      query_hash = {
        width: 500,
        height: 500,
        projection: 'm',
        colourmap: 'Lefebvre2.col',
        seed: map_generator.seed
      }
      expect(map_generator.query_hash).to eq(query_hash)
    end
  end

  describe '#request_url' do
    it 'returns the url for the map service' do
      uri = URI::HTTP.build(
        host: 'topps.diku.dk',
        path: '/torbenm/maps.msp',
        query: "colourmap=Lefebvre2.col&height=500&projection=m&seed=#{map_generator.seed}&width=500"
      )
      expect(map_generator.request_url).to eq(uri)
    end
  end
end
