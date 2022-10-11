require_relative 'bank/account'

bank_account = Bank::Account.new(
  pin: '1234',
  balance: 0,
  overdraft_limit: 100,
  transactions: []
)

bank_account.deposit(100)

puts

bank_account.withdraw(100, '1234')
bank_account.withdraw(100, '1234')
bank_account.withdraw(100, '1234')

puts

Bank::Display.statement('1234', bank_account)

puts

bank_account.withdraw(100, '1235')
Bank::Display.balance('1235', bank_account)
Bank::Display.statement('1235', bank_account)
