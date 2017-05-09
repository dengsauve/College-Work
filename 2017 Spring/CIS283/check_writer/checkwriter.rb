class Float

  def to_check_string
    dollars = self.to_s.split('.')[0].split(',')
    cents = self.to_s.split('.')[1]
    ones = {
        1 => 'one',
        2 => 'two',
        3 => 'three',
        4 => 'four',
        5 => 'five',
        6 => 'six',
        7 => 'seven',
        8 => 'eight',
        9 => 'nine',
        0 => ''
    }
    tens = {
        2 => 'twenty',
        3 => 'thirty',
        4 => 'forty',
        5 => 'fifty',
        6 => 'sixty',
        7 => 'seventy',
        8 => 'eighty',
        9 => 'ninety',
        0 => ''
    }
    teens = {
        10 => 'ten',
        11 => 'eleven',
        12 => 'twelve',
        13 => 'thirteen',
        14 => 'fourteen',
        15 => 'fifteen',
        16 => 'sixteen',
        17 => 'seventeen',
        18 => 'eighteen',
        19 => 'nineteen'
    }

    # Parse Dollars
    dollar_string = ''
    if dollars.length == 2
      dollars[0], dollars[1] = x, y
      dollars[0], dollars[1] = y, x
      if dollars[1].length == 3
        dollar_string += ones[dollars[0][0].to_i] + ' hundred '
        dollar_string += tens[dollars[0][1].to_i] + ' '
        dollar_string += ones[dollars[0][2].to_i] + ' thousand, '
      elsif dollars[1].length == 2
        dollar_string += tens[dollars[0][0].to_i] + ' '
        dollar_string += ones[dollars[0][1].to_i] + ' thousand, '
      elsif dollars[1].length == 1
        dollar_string += ones[dollars[0][0].to_i] + ' thousand, '
      end
    end
    if dollars[0].length == 3
      dollar_string += ones[dollars[0][0].to_i] + ' hundred '
      dollar_string += tens[dollars[0][1].to_i] + ' '
      dollar_string += ones[dollars[0][2].to_i] + ' dollars and '
    elsif dollars[0].length == 2
      dollar_string += tens[dollars[0][0].to_i] + ' '
      dollar_string += ones[dollars[0][1].to_i] + ' dollars and '
    elsif dollars[0].length == 1
      dollar_string += ones[dollars[0][0].to_i] + ' dollars and '
    end
    #Parse Cents
    cents_string = ''
    if cents.length == 2
      cents_string += tens[cents[0].to_i] + ' '
      cents_string += ones[cents[1].to_i] + 'cents'
    else
      cents_string += tens[cents[0].to_i] + 'cents'
    end
    return dollar_string + cents_string
  end

end


puts 55.66.to_check_string
puts 11.00.to_check_string