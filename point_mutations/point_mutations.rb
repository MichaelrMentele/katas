class DNA
  def initialize(strand)
    @dna_strand = strand
  end

  def hamming_distance(comparison_strand)
    distance = 0

    dna_list = @dna_strand.split("")
    relative = comparison_strand.split("")

    dna_list.each_with_index do |nucleotide, index| 
      return distance if relative[index] == nil

      if nucleotide != relative[index]
        distance += 1
      end
    end
    distance
  end

end