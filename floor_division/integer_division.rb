module IntegerDivision


  def IntegerDivision.binary_search_absolute_division(array,num,div)
    if ( num < 0 || div < 0 )
      raise "Intended for use with positive integers; Please post-process negative numbers"
    end
    low, high = 0, array.length - 1
    while low <= high
      mid = (low + high) / 2
      if array[mid]*div > num
        high = mid - 1
      elsif array[mid]*div < num
        if array[mid+1]*div > num
          return array[mid]
        else
          low = mid + 1
        end
      else
        return array[mid]
      end
    end
  end

  def IntegerDivision.isResultNegative?(num,div)
    case
    when (num > 0 and div > 0)
      return false
    when (num < 0 and div < 0)
      return false
    else
      return true
    end
  end

  def IntegerDivision.floor_division(num,div)
    case
    when (num == nil || div == nil) then raise "Null input"
    when ( div == 0) then raise "Cannot divide by zero"
    when (num == div ) then return [1,0]
    end
    negative = IntegerDivision.isResultNegative?(num,div)
    if ( num.abs > div.abs)
      range = div.abs**2 <= num.abs ? (div.abs..num.abs) : (1..div.abs)
      begin
        quotient = IntegerDivision.binary_search_absolute_division(range.to_a, num.abs, div.abs)
        if (negative)
          quotient =  IntegerDivision.floor( quotient)
        end

        remainder =  IntegerDivision.remainder(num, div, quotient)
        return [quotient , remainder]
      rescue
        raise "Exception while dividing"
      end
    elsif (num.abs < div.abs)
      if (negative)
        return [-1, IntegerDivision.remainder(num, div, -1)]
      else
        return [0, IntegerDivision.remainder(num, div, 0)]
      end
    end
  end

  def IntegerDivision.remainder(num, div, quotient)
    num - (quotient * div)
  end

  def IntegerDivision.floor(num)
    return (num * -1) - 1
  end


end

puts IntegerDivision.floor_division(6,5)

puts IntegerDivision.floor_division(6,-5)

puts IntegerDivision.floor_division(-6,5)

puts IntegerDivision.floor_division(-6,-5)
