NUMERALS = { M: 1000, CM: 900, D: 500, CD: 400, C: 100, XC: 90, L: 50, XL: 40, X: 10, IX: 9, V: 5, IV: 4, I: 1 }
  
def to_roman(number)
  return '' if number <= 0
  NUMERALS.each { |key, val| return key.to_s + to_roman(number - val) if number >= val }
end
  
def from_roman(roman=@roman)
  return 0 if roman == ''
  return 0 if roman == nil
  result = 0
  NUMERALS.each do |key, val|
    if roman.start_with?(key.to_s) 
      roman.slice!(key.to_s)
      result += val + from_roman(roman) 
    end
  end
  return result
end


a = "MCMLXIX"

puts a.inspect
puts from_roman(a)
puts from_roman(to_roman(1959))



