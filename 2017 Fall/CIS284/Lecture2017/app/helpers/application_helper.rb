module ApplicationHelper

  def calendar(month, year)

    # Create new Date object based on parameters
    current_date = Date.new(year, month)

    first_day = current_date.at_beginning_of_month.wday
    last_day = current_date.at_end_of_month.day

    cal_str = ''

    # Previous and next params
    previous_month = month - 1
    previous_year = year
    next_month = month + 1
    next_year = year

    # Logic for edge cases
    if month == 1
      previous_month = 12
      previous_year = year - 1
    elsif month == 12
      next_year = year + 1
      next_month = 1
    end

    cal_str += '<div class="col-xs-6">'
    cal_str += link_to 'Previous Month', calendar_path(month: previous_month, year: previous_year), class: 'btn btn-info'
    cal_str += '</div>'

    cal_str += '<div class="col-xs-6">'
    cal_str += link_to 'Next Month', calendar_path(month: next_month, year: next_year), class: 'btn btn-info'
    cal_str += '</div>'

    cal_str += '<table class="table table-bordered calendar">'

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

    target_day = 0

    #Create the first week of the month - days
    (7 - first_day).times do |date|
      cal_str += '    <td class="text-left">' + (date + 1).to_s + '</td>'
      target_day = date
    end

    cal_str += '</tr>'

    ((last_day - target_day) / 7).times do
      cal_str += '<tr>'
      7.times do
        cal_str += '<td class="text-left">' + target_day.to_s + '</td>'
        target_day += 1
      end
      cal_str += '</tr>'
    end

    if target_day < last_day
      count = 0
      cal_str += '<tr>'

      while target_day <= last_day
        cal_str += '<td class="text-left">' + target_day.to_s + '</td>'
        target_day += 1
        count += 1
      end

      (7 - count).times do
        cal_str += '<td>&nbsp;</td>'
      end

      cal_str += '</tr>'

    end


    # cal_str += '</tr>'
    cal_str += '</tbody>'
    cal_str += '</table>'



    return cal_str

  end



end
