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

    ret_arr = []
    not_teen = true
    # Parse the basics
    if dollars == '0'
      ret_arr << 'Zero dollars and'
    elsif dollars == '1'
      ret_arr << 'one dollar and'
    else
      # Parse 100,000s
      if dollars.length > 5
        num = dollars[dollars.length - 6].to_i
        ret_arr << ones[num]
        ret_arr << 'hundred'
      end
      #Parse 10,000s
      if dollars.length > 4
        num = dollars[dollars.length - 5].to_i
        #Handle Teens
        if num == 1
          num = dollars[dollars.length - 4].to_i
          ret_arr << teens[10 + num]
          if dollars[(dollars.length-3)..(dollars.length - 1)] == '000'
            ret_arr << 'thousand'
          else
            ret_arr << 'thousand,'
          end
          not_teen = false
        else
          ret_arr << tens[num] unless num == 0
        end
      end
      #Parse 1,000s
      if dollars.length > 3 && not_teen
        num = dollars[dollars.length - 4].to_i
        ret_arr << ones[num] unless num == 0
        if dollars[(dollars.length-3)..(dollars.length - 1)] == '000'
          ret_arr << 'thousand'
        else
          ret_arr << 'thousand,'
        end
      end
      not_teen = true
      #Parse 100s
      if dollars.length > 2
        num = dollars[dollars.length - 3].to_i
        ret_arr << ones[num] unless num == 0
        ret_arr << 'hundred' unless num == 0
      end
      #Parse 10s
      if dollars.length > 1
        num = dollars[dollars.length - 2].to_i
        if num == 1
          num = dollars[dollars.length - 1].to_i + 10
          ret_arr << teens[num]
          not_teen = false
        else
          ret_arr << tens[num] unless num == 0
        end
      end
      #Parse 1s
      if dollars.length > 0 and not_teen
        num = dollars[dollars.length - 1].to_i
        ret_arr << ones[num] unless num == 0
      end
      ret_arr << 'dollars and'
    end

    #Parse Cents
    if cents == '01'
      ret_arr << 'one Cent'
    elsif cents == '0'
      ret_arr << 'Zero Cents'
    else
      if cents.length == 2
        num = cents[0].to_i
        if num == 1
          num = cents[1].to_i + 10
          ret_arr << teens[num]
        else
          ret_arr << tens[num] unless num == 0
          num = cents[1].to_i
          ret_arr << ones[num]
        end
      else
        num = cents[0].to_i
        ret_arr << tens[num]
      end
      ret_arr << 'Cents'
    end

    return ret_arr.join(' ')

    ## End of Method ##
  end
end