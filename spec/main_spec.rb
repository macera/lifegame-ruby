require 'spec_helper'
require 'pry'
require_relative '../main'
describe 'ライフゲーム' do
  it('既存の出力と比較する') do
    current_dir = File.dirname(__FILE__)
    f = File.open("#{current_dir}/../original_output")
    output = f.read
    expect(lifegame).to eq(output)
  end
end
