# ARGV[i]で引数の経過年数を取得できます。
# 経過年数をコマンドライン引数から取得
years = ARGV[0].to_i

# 初期状態
cats = []
kittens = [{ age: 0 }]

# 年数分ループして猫と子猫の成長をシミュレーション
(1..years).each do
  # 子猫が成長する: 2年目で猫に変わる
  kittens.each do |kitten|
    kitten[:age] += 1
    # 子猫が2歳になったら猫に変わる
    if kitten[:age] == 2
      cats << { age: 0 }
    end
  end

  # 成長した子猫（猫に変わったもの）を除外
  kittens.reject! { |kitten| kitten[:age] == 2 }
  
  # 猫が新しい子猫を産む
  cats.each do |_cat|
    kittens << { age: 0 }
  end
end

# 最終的な子猫と猫の数を出力
puts({ cat: cats.size, kitten: kittens.size })