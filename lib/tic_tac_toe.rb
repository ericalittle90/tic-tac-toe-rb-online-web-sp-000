WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def valid_move?(board, index)
  if !position_taken?(board, index) && index.between?(0,8)
    true
  else
    false
  end
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else
    true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else turn(board)
  end
end

def turn_count(board)
  turn = 0
board.count do |count|
  if count != " "
turn += 1
end
end
end

def current_player(board)
if turn_count(board) % 2 == 0
return "X"
else turn_count(board) % 2 != 0
return "O"
end
end

def won?(board)
  WIN_COMBINATIONS.any? do |index|
if (board[index[0]] == "X" && board[index[1]] == "X" && board[index[2]] == "X") ||
  (board[index[0]] == "O" && board[index[1]] == "O" && board[index[2]] == "O")
return index
else
  false
end
end
end

def full?(board)
board.all? do |index|
index == "X" || index == "O"
end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

def over?(board)
if won?(board) || draw?(board)
  true
else
  false
end
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end

def play(board)
 until over?(board)
 turn(board)
 end
 if won?(board)
   puts "Congratulations #{winner(board)}!"
 elsif draw?(board)
   puts "Cat's Game!"
 end
end
