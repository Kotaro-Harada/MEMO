require "csv"
 
puts "1(新規でメモを作成) 2(既存のメモを編集する)"

input = gets.to_i
if input == 1
    puts "拡張子を除いたファイルを入力してください"
    
    title = gets.chomp.to_s
    
    puts "メモしたい内容を記入してください"
    puts "完了したらCtrl + Dをおします"
    
    CSV.open("#{title}.csv", "w") do |csv|
        while line = gets
            memo_type = line.chomp
            csv << [memo_type]
        end

    end

elsif input == 2
    puts "拡張子を除いたファイルを入力してください"
    
    title = gets.chomp.to_s
    
    puts "メモ内容は以下の通りです"
   
    p CSV.read("#{title}.csv")
   
    puts "追記する場合は内容を記入してください"
    puts "完了したらCtrl + Dをおします"
    
    CSV.open("#{title}.csv", "a+") do |csv|
        while line = gets
            memo_type = line.chomp
            csv << [memo_type]
        end
    end

    puts "Y(メモ内容をリセットする)　N(メモ内容をリセットしない)"
    
    reset = gets.chomp.to_s
    if reset == "Y"
        puts "メモしたい内容を記入してください"
        puts "完了したらCtrl + Dをおします"
        
        CSV.open("#{title}.csv", "w") do |csv|
            while line = gets
                memo_type = line.chomp
                csv << [memo_type]
            end
        end
    elsif reset == "N"
    end

end

