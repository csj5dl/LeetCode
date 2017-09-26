#電腦下棋AI版本

def display_board(board)
  puts " #{board[6]} | #{board[7]} | #{board[8]}"
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]}"
  puts "-----------"
  puts " #{board[0]} | #{board[1]} | #{board[2]}"
end

def chk_piece(board,idx)
  if board[idx] == "O" || board[idx] == "X" 
    puts "該位置已經有人下過了，請重新輸入"
    return true
  end
  return false
end

def chk_winner(some_array,chkin)
  #先寫死判斷
  if some_array[0] == chkin && some_array[1] == chkin && some_array[2] == chkin
    return true
  end
  if some_array[3] == chkin && some_array[4] == chkin && some_array[5] == chkin
    return true
  end
  if some_array[6] == chkin && some_array[7] == chkin && some_array[8] == chkin
    return true
  end
  if some_array[0] == chkin && some_array[3] == chkin && some_array[6] == chkin
    return true
  end
  if some_array[1] == chkin && some_array[4] == chkin && some_array[7] == chkin
    return true
  end
  if some_array[2] == chkin && some_array[5] == chkin && some_array[8] == chkin
    return true
  end
  if some_array[0] == chkin && some_array[4] == chkin && some_array[8] == chkin
    return true
  end
  if some_array[2] == chkin && some_array[4] == chkin && some_array[6] == chkin
    return true
  end
  return false
end

def chk_damage(some_array,keyin,chkin)

  pc_dg_array = []   #紀錄需要阻擋的位置

  ####處理水平連線####
  l_min = 1
  l_max = 0
  case 
    when keyin == "1" || keyin == "2" || keyin == "3"
      l_min = 0
      l_max = 2
    when keyin == "4" || keyin == "5" || keyin == "6"
      l_min = 3
      l_max = 5
    when keyin == "7" || keyin == "8" || keyin == "9"
      l_min = 6
      l_max = 8
  end
  #puts "min>>> #{l_min} ,max >> #{l_max}"  #JJJJ
  l_x = 0   #對方預計連線數
  l_array = -1
  while (l_min <= l_max)
    if some_array[l_min] == chkin 
      l_x += 1
    else
      l_array = l_min
    end

    l_min += 1  #水平連線+1
  end
  #當對方快要連線時,紀錄可以下棋的地方
  if l_x >= 2 && l_array >= 0
    #如果記錄到的array 沒有人下過，才能紀錄
    if some_array[l_array] != "O" && some_array[l_array] != "X"
      pc_dg_array.push(l_array)   #陣列增加一筆
    end
  end

  ####處理垂直連線####
  l_min = 1
  l_max = 0
  case 
    when keyin == "1" || keyin == "4" || keyin == "7"
      l_min = 0
      l_max = 6
    when keyin == "2" || keyin == "5" || keyin == "8"
      l_min = 1
      l_max = 7
    when keyin == "3" || keyin == "6" || keyin == "9"
      l_min = 2
      l_max = 8
  end
  l_x = 0   #對方預計連線數
  l_array = -1
  while (l_min <= l_max)
    if some_array[l_min] == chkin 
      l_x += 1
    else
      l_array = l_min
    end

    l_min += 3  #垂直連線+3
  end
  #當對方快要連線時,紀錄可以下棋的地方
  if l_x >= 2 && l_array >= 0
    #如果記錄到的array 沒有人下過，才能紀錄
    if some_array[l_array] != "O" && some_array[l_array] != "X"
      pc_dg_array.push(l_array)   #陣列增加一筆
    end
  end

  ####處理交叉連線####
  l_min = 1
  l_max = 0
  case 
    when keyin == "1" || keyin == "5" || keyin == "9"
      l_min = 0
      l_max = 8
      l_add = 4   #每次+4
    when keyin == "3" || keyin == "5" || keyin == "7"
      l_min = 2
      l_max = 6
      l_add = 2   #每次+2
  end
  l_x = 0   #對方預計連線數
  l_array = -1
  while (l_min <= l_max)
    
    if some_array[l_min] == chkin 
      l_x += 1
    else
      l_array = l_min
    end

    l_min = l_min + l_add
  end
  #當對方快要連線時,紀錄可以下棋的地方
  if l_x >= 2 && l_array >= 0
    #如果記錄到的array 沒有人下過，才能紀錄
    if some_array[l_array] != "O" && some_array[l_array] != "X"
      pc_dg_array.push(l_array)   #陣列增加一筆
    end
  end
  return pc_dg_array
end
#==========================================
#顯示棋盤
some_array = [ "1","2","3","4","5","6","7","8","9"]
puts "#{display_board(some_array)}"

pc_keyin = "-1"  #電腦上一筆下棋的位置
l_i = 0  #下棋的次數
while(l_i  < 9)

  #====使用者下棋=====
  puts "輸入要下棋的位置(1~9)後Enter"
  keyin = gets.chomp   #輸入資料

  case keyin
    when "1"
      if chk_piece(some_array,0)
        next
      end
      some_array[0] = "O"
    when "2"
      if chk_piece(some_array,1)
        next
      end
      some_array[1] = "O"
    when "3"
      if chk_piece(some_array,2)
        next
      end
      some_array[2] = "O"
    when "4"
      if chk_piece(some_array,3)
        next
      end
      some_array[3] = "O"
    when "5"
      if chk_piece(some_array,4)
        next
      end
      some_array[4] = "O"
    when "6"
      if chk_piece(some_array,5)
        next
      end
      some_array[5] = "O"
    when "7"
      if chk_piece(some_array,6)
        next
      end
      some_array[6] = "O"
    when "8"
      if chk_piece(some_array,7)
        next
      end
      some_array[7] = "O"
    when "9"
      if chk_piece(some_array,8)
        next
      end
      some_array[8] = "O"
    else
      next   #輸入1~9以外的處理，continue while
  end
  
  l_i += 1
  
  if chk_winner(some_array,"O")
    puts "#{display_board(some_array)}"
    puts "遊戲結束。使用者獲勝"
    break
  end
  if l_i >= 9
    puts "遊戲結束。無人獲勝"
    break
  end
  
  #====電腦下棋=====
  #----非AI版----
  l_j = 0
  l_k = 0
  pc_ok_array = []   #允許電腦下棋的位置
  while (l_j < 9)
    #找出電腦可下棋的位置
    if some_array[l_j] != "O" && some_array[l_j] != "X"
      pc_ok_array[l_k] = l_j
      l_k += 1
    end
    l_j += 1
  end


  #----AI版----
  #取得預計阻擋的位置
  pc_dg_array = []   #需要阻擋的位置
  pc_dg_array = chk_damage(some_array,keyin,"O")
  #puts "chk_damage >>> #{pc_dg_array}"
  
  #取得勝利的位置
  pc_win_array = []   #需要攻擊的位置
  if pc_keyin != "-1"
    pc_win_array = chk_damage(some_array,pc_keyin,"X")
  end
  
  #判斷可以下棋的位置
  case
    when pc_win_array.length > 0
      l_k = pc_win_array[rand(pc_win_array.length)] #取陣列亂數
    when pc_dg_array.length > 0
      l_k = pc_dg_array[rand(pc_dg_array.length)]   #取陣列亂數
    else
      l_k = pc_ok_array[rand(pc_ok_array.length)]   #取陣列亂數
  end
  pc_keyin = some_array[l_k]   #紀錄該次下的位置
  some_array[l_k] = "X"        #電腦下棋

  
  l_i += 1
  
  if chk_winner(some_array,"X")
    puts "#{display_board(some_array)}"
    puts "遊戲結束。電腦獲勝"
    break
  end  

  puts "#{display_board(some_array)}"
end 
