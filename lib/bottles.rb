# Bottles class
class Bottles
  def verse(count)
    if count.zero?
      return <<-VERSE
  No more bottles of beer on the wall, no more bottles of beer.
  Go to the store and buy some more, 99 bottles of beer on the wall.
      VERSE
    end

    plural = count != 1 ? 's' : ''
    verse = "#{count} bottle#{plural} of beer on the wall, #{count} bottle#{plural} of beer."
    take_count = count == 1 ? 'it' : 'one'
    count -= 1
    count_str = count > 0 ? count : 'no more'
    plural = count != 1 ? 's' : ''
    verse = <<-VERSE
  #{verse}
  Take #{take_count} down and pass it around, #{count_str} bottle#{plural} of beer on the wall.
    VERSE
    verse
  end

  def verses(first, last)
    bottles = first.downto(last)
    out = ''
    bottles.each_with_index do |c, i|
      newline = i < bottles.count - 1 ? "\n" : ''
      out += verse(c) + newline
    end
    out
  end

  def song
    verses(99,0)
  end
end
