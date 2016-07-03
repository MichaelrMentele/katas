class Translation
  CODON_TRANSLATIONS = {
   "Methionine" => ['AUG'],
   "Phenylalanine" => ['UUU', 'UUC'],
   "Leucine" => ["UUA", "UUG"],
   "Serine" => ["UCU", "UCC", "UCA", "UCG"],
   "Tyrosine" => ["UAU", "UAC"],
   "Cysteine" => ["UGU", "UGC"],
   "Tryptophan" => ["UGG"],
   "STOP" => ["UAA", "UAG", "UGA"]
  }

  def self.of_codon(codon)
    Translation::CODON_TRANSLATIONS.each do |key, arr|
      return key if arr.include?(codon)
    end
    raise InvalidCodonError
  end

  def self.of_rna(strand)
    codons = strand.scan(/.{3}/)
    translations = []
    codons.each do |codon|
      translation = of_codon(codon)
      break if stop?(translation)
      translations.push(translation)
    end
    translations
  end

  def self.stop?(string)
    'STOP' == string
  end

end

class InvalidCodonError < StandardError
end