# time object, extension of Fixnum

class Fixnum #'Monkey-Patch'
  def minutes # returns minutes in seconds
    return self * 60
  end

  def hours # returns hours in seconds
    return self * 60 * 60
  end

  def days # returns days in seconds
    return self * 60 * 60 * 24
  end

  def weeks
    return self * 60 * 60 * 24 * 7
  end

  def ago # returns current epoch time - seconds
    return Time.now - self
  end
end


puts 1.days
puts 10.minutes
puts 5.days.ago
puts 8.weeks.ago