# TODO
X = 5
Y = 5
LIFE_CYCLE = 3

def lifegame
  lines = ""

  # 初期化
  cells = []
  Y.times do |y|
    cells << []
    X.times do |x|
      cells[y] << '□'
    end
  end

  # 初期設定
  cells[2][1] = '■'
  cells[2][2] = '■'
  cells[2][3] = '■'

  #初期設定の改行設定
  Y.times do |y|
    line = ""
    X.times do |x|
      line += cells[y][x]
    end
    lines += line + "\n"
  end

  # ゲームスタート
  LIFE_CYCLE.times do |time|
    new_cells = [[],[],[],[],[]]
    Y.times do |y|
      X.times do |x|
        count = 0

        if cells[y][x] == '□'
          # 誕生の場合
          count = 0
          count += 1 if cells[y-1][x-1] == '■'
          count += 1 if cells[y-1][x] == '■'
          count += 1 if cells[y-1][x+1] == '■'
          count += 1 if cells[y][x-1] == '■'
          count += 1 if cells[y][x+1] == '■'
          count += 1 if y < 4 && cells[y+1][x-1] == '■'
          count += 1 if y < 4 && cells[y+1][x] == '■'
          count += 1 if y < 4 && cells[y+1][x+1] == '■'
          new_cells[y][x] = count >= 3 ? '■' : '□'
        end

        if cells[y][x] == '■'
          # 生存・過疎・過密の場合
          count = 0
          count += 1 if cells[y-1][x] == '■'
          count += 1 if cells[y][x-1] == '■'
          count += 1 if cells[y][x+1] == '■'
          count += 1 if cells[y+1][x] == '■'
          new_cells[y][x] = count == 2 ? cells[y][x] : '□'
        end
      end
    end
    cells = new_cells
    lines += "#{time}==========" + "\n"
    Y.times do |y|
      line = ""
      X.times do |x|
        line += cells[y][x]
      end
      lines += line + "\n"
    end
  end

  lines

end
