class SuicideCircle
  def initialize(num=40)
    @participants = []
    for i in (0..(num - 1)) do
      @participants.push(i)
    end
  end

  def survival_position
    # we can have a queue of size 7
    count = 0
    begin
      participant = @participants.shift
      count += 1
      if count == 7
        count = 0
      else
        @participants.push(participant)
      end
    end until @participants.length == 1
    return @participants[0]
  end
end
