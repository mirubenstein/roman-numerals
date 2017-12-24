class Integer
  ROMAN_NUMERALS = {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }.freeze

  def to_roman
    recurse_roman self, ''
  end

  def recurse_roman(number, roman_numeral)
    largest_roman_numeral_included = ROMAN_NUMERALS.dup.keys.find { |num| num <= number }
    roman_numeral.concat ROMAN_NUMERALS[largest_roman_numeral_included]
    new_number = number - largest_roman_numeral_included
    if new_number.zero?
      roman_numeral
    else
      recurse_roman new_number, roman_numeral
    end
  end
end

module BookKeeping
  VERSION = 2
end
