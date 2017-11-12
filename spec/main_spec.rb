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
  it('初期ボードを生成する') do
    lifecycle = LifeCycle.new
    board = []
    LifeCycle::Y.times { board << Array.new(LifeCycle::X, "□") }
    expect(lifecycle.board).to eq(board)
  end
end

# TODO
# - [] 初期ボードを生成する
# - [] 初期状態を設定する
# - [] 機能を移植する
#   - [] ゲームスタートの機能を追加する
