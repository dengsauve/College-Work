class Float

  def to_check_string
    dollars = self.to_s.split('.')[0]
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
        1 => 'ten',
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
    ret_str = ''
    not_teen = true

    ## Parse Dollars ##
    if dollars.length > 5
      ret_str += ones[dollars[0].to_i] + ' hundred'
    end
    if dollars.length > 4
      num = dollars[dollars.length - 5].to_i
      ret_str += (dollars.length > 5 && num != 0 ? ' ' : '' ) +
          (num == 1 ? teens[(num.to_s + dollars[length - 4]).to_i] : tens[num]) +
          (num == 0 ? '' : ' ')
      not_teen = false if num == 1
    end
    if dollars.length > 3 and not_teen
      num = dollars[dollars.length - 4].to_i
      ret_str += (dollars.length > 4 && num != 0 ? ' ' : '')+
          ones[num] +
          ' thousand,'
    else
      not_teen = true
      ret_str += dollars.length > 3 ? ' thousand,' : ''
    end
    if dollars.length > 2
      num = dollars[dollars.length - 3].to_i
      ret_str += (dollars.length > 3 and num != 0 ? ' ' : '') +
          ones[num] +
          (num != 0 ? ' hundred' : '')
    end
    if dollars.length > 1
      num = dollars[dollars.length - 2].to_i
      ret_str += (dollars.length > 2 && num != 0 ? ' ' : '') +
          (num == 1 ? teens[(num.to_s + dollars[dollars.length - 1]).to_i] : tens[num]) +
          (num != 0 ? ' ' : '')
      if num == 1
        not_teen = false
        ret_str += 'dollars and'
      end
    end
    if dollars.length == 1
      if dollars[0] == '0'
        ret_str += 'Zero dollars and'
      elsif dollars[0] == '1'
        ret_str += 'one dollar and'
      else
        ret_str += ones[dollars[0].to_i] + ' dollars and'
      end
    elsif dollars.length > 0 && not_teen
      ret_str += ones[dollars[dollars.length - 1].to_i] + (dollars[dollars.length-1] == '0' ? '' : ' ') + 'dollars and'
    end

    ## Parse Cents ##
    if cents.length > 1
      num = cents[0].to_i
      if num == 0
        ret_str += ' ' + ones[cents[1].to_i] + (cents[1] == '1' ? ' Cent' : ' Cents')
      elsif num == 1
        ret_str += ' ' + teens[(num.to_s + cents[1]).to_i] + ' Cents'
      else
        ret_str += ' ' + tens[num] + (cents[1] == '0' ? '' : ' ') + ones[cents[1].to_i] + ' Cents'
      end
    else
      ret_str += (cents[0] == '0' ? ' Zero' : ' ' + tens[cents[0].to_i]) + ' Cents'
    end

    return ret_str
    ## End of Method ##
  end
end