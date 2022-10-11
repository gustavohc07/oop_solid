require_relative 'bank/account'
require_relative 'bank/display'
require_relative 'bank/transactions'

bank_account = Bank::Account.new(
  pin: '1234',
  balance: 0,
  overdraft_limit: 100,
  transactions: []
)

Bank::Transactions::Deposit.new(account: bank_account).fulfil(amount: 100)

puts

Bank::Transactions::Withdraw.new(verification_pin: '1234', account: bank_account).fulfil(amount: 100)
Bank::Transactions::Withdraw.new(verification_pin: '1234', account: bank_account).fulfil(amount: 100)
Bank::Transactions::Withdraw.new(verification_pin: '1234', account: bank_account).fulfil(amount: 100)

puts

Bank::Display.statement('1234', bank_account)

puts

Bank::Transactions::Withdraw.new(verification_pin: '1235', account: bank_account).fulfil(amount: 100)
Bank::Display.balance('1235', bank_account)
Bank::Display.statement('1235', bank_account)
