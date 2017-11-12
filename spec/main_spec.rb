require 'spec_helper'
require 'pry'
require_relative '../main'

describe 'ライフゲーム' do
  it '既存の出力と比較する' do
    current_dir = File.dirname(__FILE__)
    f = File.open("#{current_dir}/../original_output")
    output = f.read
    expect(lifegame).to eq(output)
  end
end

describe 'LifeGame' do
  let(:lifegame) { LifeGame.new }
  let(:board) { 
    board = []
    LifeGame::Y.times { board << Array.new(LifeGame::X, LifeGame::DEATH) }
    board
  }

  it '初期ボードを生成する' do
    expect(lifegame.board).to eq(board)
  end
  it '初期状態を設定する' do
    lifegame.born([2,1],[2,2],[2,3])

    board[2][1] = LifeGame::LIFE
    board[2][2] = LifeGame::LIFE
    board[2][3] = LifeGame::LIFE
    expect(lifegame.board).to eq(board)
  end

  describe '初期状態を改行設定する' do
    context '初期ボードを生成した後' do
        it '状態を改行表示する' do
    snapshot = <<-EOS
□□□□□
□□□□□
□□□□□
□□□□□
□□□□□
    EOS
    expect(lifegame.capture).to eq(snapshot)
  end
    end
    context '初期状態を設定した後' do
      it '状態を改行表示する' do
        lifegame.born([2,1],[2,2],[2,3])
        snapshot = <<-EOS
□□□□□
□□□□□
□■■■□
□□□□□
□□□□□
         EOS
        expect(lifegame.capture).to eq(snapshot)
      end
    end
  end


end

# TODO
# - [x] 初期ボードを生成する
# - [x] 初期状態を設定する
# - [x] 初期状態を改行設定する
# - [] 機能を移植する
#   - [] ゲームスタートの機能を追加する
