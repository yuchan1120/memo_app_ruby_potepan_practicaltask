require "csv"
  mode_selection = false
  until mode_selection ==true do
    puts "1(新規でメモを作成) 2(既存のメモ編集する)"
 
    memo_type = gets.to_s

    if memo_type == "1\n"
      puts "作成するファイルの名前（拡張子は除く）を入力してください"
      file_name = gets.to_s
      CSV.open("#{file_name.chomp}.csv", "w")
      keep = false
      until keep == true do
      puts "メモしたい内容を記入してください"
      content = gets.to_s
        puts "保存してよろしいですか？"
        puts "1(はい) 2(いいえ)"
        keep_reply = gets.to_s
        if keep_reply == "1\n"
          keep = true
        end
      end
      puts ("メモを保存しました")
      puts "-----------"
      puts "-----------"
      CSV.open("#{file_name.chomp}.csv", "w") do |memo|
      memo << ["#{content}"]
      end

    elsif memo_type == "2\n"
      confirmation = false
      until confirmation == true do
        puts "編集するファイルの名前（拡張子は除く）を入力してください"
        file_name = gets.to_s
        if File.exist?("#{file_name.chomp}.csv") == false
          puts "入力したファイルは存在しません"
        else
          content = CSV.read("#{file_name.chomp}.csv")
          puts "-----------"
          puts content
          puts "-----------"
          puts "上のメモで間違いないですか？"
          puts "1(はい) 2(いいえ)"
          confirmation_reply = gets.to_s
          if confirmation_reply == "1\n"
            confirmation = true
          end
        end
      end
      keep = false
      until keep == true do
      puts "メモしたい内容を記入してください"
      content = gets.to_s
        puts "メモを上書きします よろしいですか？ (＊変更前のメモは削除されます)"
        puts "1(はい) 2(いいえ)"
        keep_reply = gets.to_s
        if keep_reply == "1\n"
          puts "本当によろしいですか？ (＊変更前のメモは削除されます)"
          puts "1(はい) 2(いいえ)"
          keep_reply2 = gets.to_s
          if keep_reply2 == "1\n"
            keep = true
          end
        end
      end
      puts ("メモを保存しました")
      puts "-----------"
      puts "-----------"
      CSV.open("#{file_name.chomp}.csv", "w") do |memo|
      memo << ["#{content}"]
      end
    end
  end



    