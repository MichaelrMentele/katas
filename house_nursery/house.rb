class House
  
  def self.recite
    lines = pieces.reverse
    recital = ""
    lines.each_with_index do |line, index|
      recital += "This is " + line.first + "\n"
      recital += previous?(index) ? all_previous(lines, index): ""
      recital += "\n"
    end
    recital.chomp
  end

  private

  def self.previous?(index)
    index > 0
  end

  def self.all_previous(lines, current_index)
    index = current_index

    previous_lines = ""
    until index == 0
      current_line = lines[index]

      index -= 1
      previous_line = lines[index]

      previous_lines += current_line.last + " " + previous_line.first + "\n"
    end
    previous_lines
  end

  def self.pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built.']
    ]
  end
end
