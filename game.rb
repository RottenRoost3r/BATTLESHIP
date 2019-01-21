require_relative "cells.rb"
require_relative "boats.rb"
require_relative "board.rb"
require_relative "enemy.rb"

boards = {"b" => Grid.new(12), "i" => Grid.new(24), "e" => Grid.new(36)}

puts "Please select difficulty: Beginner [b], Intermediate [i], Expert[e]"
response = gets.chomp

board = ""

boards.each do |key, value|
    if response == key
        board = value        
    end
end

if board.size == 12
    nme_board = Grid.new(12)
    opponent = Enemy.new(nme_board)
elsif board.size == 24
    nme_board = Grid.new(24)
    opponent = Enemy.new(nme_board)
else
    nme_board = Grid.new(36)
    opponent = Enemy.new(nme_board)
end


def make_board(board)
    counter_top = 0
    print " "

    board.grid.each_with_index do |v, i|
        if counter_top < 10
            print "   #{counter_top}"
            counter_top += 1
        else
            print "  #{counter_top}"
            counter_top += 1
        end
    end

    puts "\n"
    counter_side = 0
    board.grid.each_with_index do |v, i|
        
        v.each_with_index do |k, i|
            if i == 0
                if counter_side < 10
                    print " #{counter_side} (#{k.to_s})"
                    counter_side += 1
                else # this extra if statement was just to satisfy my ocd, it's not actually neede, the game works fine without it, but the grid is offset past row 9 because the extra digit
                    print "#{counter_side} (#{k.to_s})"
                    counter_side += 1
                end
            elsif i == board.end_point
                print " (#{k.to_s}) \n"
            else
                print " (#{k.to_s})"
            end
        end
    end
end

def make_enemy_board(nme_board)
    make_board(nme_board)
end


make_board(board); make_enemy_board(nme_board)

ships = {"Carrier" => Ship.new(5, "C"), "Battleship" => Ship.new(4, "B"), "Destroyer" => Ship.new(3, "D"), "Patrol" => Ship.new(2, "P")}

ships.each_with_index do |(key, value),index|
    puts "select the row you want your #{key} to start"
    row = gets.chomp
    puts "select the collumn you want your #{key} to start"
    col = gets.chomp
    puts "select orientation (horizontal [h], or vertical [v])"
    orientation = gets.chomp  

    redo if board.check_board(value, row.to_i, col.to_i, orientation) == false 
    redo if board.check_spaces(value, row.to_i, col.to_i, orientation) == false
    puts board.master(value, row.to_i, col.to_i, orientation) 
    system('cls')
    make_board(board); make_enemy_board(nme_board)
end; system("cls")

opponent.place_ships()
make_board(board); make_enemy_board(nme_board)

def your_turn(grid)
    1.times do
        puts "what row would you like to fire on?"
        row = gets.chomp
        puts "what collum would you like to fire on?"
        col = gets.chomp

        redo if grid.shots_fired(row.to_i, col.to_i) == "invalid"
        system('cls')
    end
end

def enemy_turn(grid)
    @coordinates = []
    num = []
    counter = 0
    grid.size.times do
        num << counter
        counter += 1
    end
    num.each do |row|
        num.each do |col|
            @coordinates << [row, col]
        end 
    end
    @possible_targets = @coordinates
    @target = @possible_targets.sample
    row = @target[0]
    col = @target[1]
    grid.shots_fired(row.to_i, col.to_i)
    system('cls')
end 

def game_play(board, nme_board)
    while end_checker(board, nme_board) == true
        your_turn(nme_board); enemy_turn(board)
        make_board(board); make_enemy_board(nme_board) 
    end
end    

def end_checker(board, nme_board)
    player_spaces = 0
    nme_spaces = 0 

    board.grid.each do |row|
        row.each do |cell|
            if cell.status == "occupied"
                player_spaces += 1
            end
        end
    end

    nme_board.grid.each do |row|
        row.each do |cell|
            if cell.status == "occupied"
                nme_spaces += 1
            end
        end
    end

    if nme_spaces == 0
        puts "YOU WIN!"
    elsif player_spaces == 0
        puts "YOU LOSE!"
    else
        true
    end

end

game_play(board, nme_board)




