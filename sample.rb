require_relative 'oyster_card'

# intialize card with 0 balance
card = OysterCard.new

# print balance
p card.balance

# rechareges card with amount
card.recharge 80

# print balance
p card.balance

# Add trips
card.add_trip "Tube Holborn to Earl's Court"
card.add_trip "328 bus from Earl's Court to Chelsea"
card.add_trip "Tube Earl's court to Hammersmith"

# print final card balance
p card.balance