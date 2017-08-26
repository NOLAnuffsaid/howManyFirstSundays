def add_n_days(n)
  (60 * 60 * 24) * n
end

def count_sunday_the_first(time, end_time)
  increment_by = 1
  count = 0
  loop do
    if time.sunday? && time.day == 1
      count += 1
      increment_by = 7
    end

    time += add_n_days(increment_by)

    break if time.year > end_time.year
  end

  count
end

def get_date()
  gets.chomp.split("/")
end

def get_start_time
  puts 'Please enter a start date(MM/DD/YYYY):'
  start_month, start_day, start_year = get_date
  Time.mktime(start_year, start_month, start_day)
end

def get_end_time
  puts 'Please enter an end date(MM/DD/YYYY):'
  end_month, end_day, end_year = get_date
  Time.mktime(end_year, end_month, end_day)
end

begin
  puts count_sunday_the_first(get_start_time,get_end_time)
rescue ArgumentError, TypeError
  $stderr.print "Invalid date entered.\nDates must use the format MM/DD/YYYY. Please try again.\n"
end

