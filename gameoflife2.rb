# kata 02 Game of life iteration 2
class Game
  def initialize
    @height = 10
    @width = 10
    @grid = [
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
      [0, 1, 1, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
      [0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
      [0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
      [1, 0, 0, 0, 1, 0, 0, 0, 0, 0],
      [0, 0, 0, 1, 1, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    ]
    @future = [
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    ]
  end

  # def generate_matrix
  #   (0...@witdh).each do |w|
  #     (0...@height).each do |h|
  #       num = rand(1..3)
  #       @future[w][h] = 0
  #       @grid[w][h] = if num == 1 || num == 2
  #                       0
  #                     else
  #                       1
  #                     end
  #     end
  #   end
  # end

  def next_generation
    draw(@grid)
    (0..@width - 2).each do |i|
      (0..@height - 2).each do |j|
        # celulas_vecinas = neighbors(i, j)
        validate_cell(i, j, neighbors(i, j))
      end
    end
    puts
    draw(@future)
  end

  def validate_cell(i_p, j_p, celulas_vecinas)
    @future[i_p][j_p] = if @grid[i_p][j_p] == 1 && celulas_vecinas < 2
                          0
                        elsif @grid[i_p][j_p] == 1 && celulas_vecinas > 3
                          0
                        elsif @grid[i_p][j_p].zero? && celulas_vecinas == 3
                          1
                        else
                          @grid[i_p][j_p]
                        end
  end

  def neighbors(i_p, j_p)
    celulas_vecinas = 0
    (-1..1).each do |a|
      (-1..1).each do |b|
        celulas_vecinas += @grid[i_p + a][j_p + b] if i_p + a >= 0 || j_p + b >= 0
      end
    end
    celulas_vecinas -= @grid[i_p][j_p]
    return celulas_vecinas
  end

  def draw(matrix)
    (0..(@width - 1)).each do |w|
      (0...(@height - 1)).each do |h|
        if matrix[w][h].zero?
          print '.'
        else
          print '*'
        end
      end
      print "\n"
    end
  end
end

# puts 'Dame el numero de filas:'
# fil = gets.to_i
# puts 'Dame el numero de columnas:'
# col = gets.to_i

game = Game.new
game.next_generation
