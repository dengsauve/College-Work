module ApplicationHelper

  def calendar(month, year)

    # Create new Date object based on parameters
    current_date = Date.new(year, month)

    first_day = current_date.at_beginning_of_month.wday
    cal_str = ''

    # Previous and next buttons


    cal_str += '<table class="table table-bordered">'

    # Calendar Title
    cal_str += '<caption class="text-center"><strong>'
    cal_str += current_date.strftime("%B %Y")
    cal_str += '</strong></caption>'

    cal_str += '<thead>'
    cal_str += '<tr>'

    # Days of the Week Headers
    # Date::DAYNAMES returns ['Sunday'...'Saturday']
    Date::DAYNAMES.each do |day|
      cal_str += '<th class="text-center">'
      cal_str += '<span class="hidden-xs hidden-sm">' + day + '</span>' + '<span class="hidden-md hidden-lg">' + day[0] + '</span>'
      cal_str += '</th>'
    end

    cal_str += '</tr>'
    cal_str += '</thead>'
    cal_str += '<tbody>'
    cal_str += '<tr> <!-- first week of month -->'

    # Create the first week of the month - blanks
    first_day.times do
      cal_str += '    <td>&nbsp;</td>'
    end

    #Create the first week of the month - days
    (7 - first_day).times do |date|
      cal_str += '    <td>' + (date + 1).to_s + '</td>'
    end

    cal_str += '</tr>'
    cal_str += '</tbody>'
    cal_str += '</table>'

    return cal_str

  end



end
