class Float

  def to_check_string
    dollars = self.to_s.split('.')[0].reverse.scan(/.{1,3}/)
    if dollars.length == 2
      dollars[1], dollars[0] = dollars[0].reverse, dollars[1].reverse
    else
      dollars[0].reverse!
    end
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
      x, y = dollars[0], dollars[1]
      dollars[0], dollars[1] = y, x

      if dollars[1].length == 3
        dollar_string += ones[dollars[1][0].to_i] + ' hundred '
        if dollars[1][1] == '1'
          dollar_string += teens[(dollars[1][1] + dollars[1][2]).to_i] + ' thousand '
        else
          dollar_string += tens[dollars[1][1].to_i]
          dollar_string += ones[dollars[1][2].to_i] + ' thousand '
        end

      elsif dollars[1].length == 2
        if dollars[1][0] == '1'
          dollar_string += teens[(dollars[1][0] + dollars[1][1]).to_i] + ' thousand '
        else
          dollar_string += tens[dollars[1][0].to_i] + ' '
          dollar_string += ones[dollars[1][1].to_i] + ' thousand, '
        end

      elsif dollars[1].length == 1
        dollar_string += ones[dollars[1][0].to_i] + ' thousand '
      end
    end

    if dollars[0].length == 3
      if dollars[0] == '000'
        dollar_string += 'dollars and '
      else
        dollar_string += ones[dollars[0][0].to_i] + ' hundred' + (dollars[0][1] == '0' ? '' : ' ')
        if dollars[0][1] == '1'
          dollar_string += teens[(dollars[0][1] + dollars[0][2]).to_i] + ' dollars and '
        else
          dollar_string += tens[dollars[0][1].to_i] + (dollars[0][2] == '0' ? '' : ' ')
          dollar_string += ones[dollars[0][2].to_i] + ' dollars and '
        end
      end

    elsif dollars[0].length == 2
      if dollars[0][0] == '1'
        dollar_string += teens[(dollars[0][0] + dollars[0][1]).to_i] + ' dollars and '
      else
        dollar_string += tens[dollars[0][0].to_i] + (dollars[0][1] == '0' ? '' : ' ')
        dollar_string += ones[dollars[0][1].to_i] + ' dollars and '
      end
    elsif dollars[0].length == 1
      if dollars[0][0] == '0'
        dollar_string += 'Zero dollars and '
      elsif dollars[0][0] == '1'
        dollar_string += 'one dollar and '
      else
        dollar_string += ones[dollars[0][0].to_i] + ' dollars and '
      end
    end

    #Parse Cents
    cents_string = ''
    if cents.length == 2
      if cents == '00'
        cents_string += 'Zero Cents'
      else
        if cents[0] == '1'
          cents_string += cents[1] == 0 ? 'ten cents' : teens[cents.to_i] + ' cents'
        elsif cents[0] == '0'
          cents_string += cents[1] == '1' ? 'one cent' : ones[cents[1].to_i] + ' cents'
        else
          cents_string += tens[cents[0].to_i] + ' ' + ones[cents[1].to_i] + ' cents'
        end
      end

    else
      if cents == '0'
        cents_string += 'Zero Cents'
      elsif cents == '1'
        cents_string += 'ten cents'
      else
        cents_string += tens[cents[0].to_i] + ' cents'
      end
    end

    return dollar_string + cents_string
  end
end

# puts 55.66.to_s + ' -> ' + 55.66.to_check_string
# puts 11.00.to_s + ' -> ' + 11.00.to_check_string
# puts 10234.44.to_s + ' -> ' + 10234.44.to_check_string
# puts 410234.44.to_s + ' -> ' + 410234.44.to_check_string
# puts 55.60.to_s + ' -> ' + 55.60.to_check_string
