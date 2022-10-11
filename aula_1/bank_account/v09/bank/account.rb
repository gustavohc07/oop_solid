require_relative 'display'

module Bank
  class Account
    attr_reader :pin
    attr_accessor :balance, :overdraft_limit, :transactions

    def initialize(pin:, balance:, overdraft_limit:, transactions: [])
      @pin = pin
      @balance = balance
      @overdraft_limit = overdraft_limit
      @transactions = transactions
    end

    def deposit(amount)
      self.balance += amount

      transactions << {type: 'credit', amount: amount, balance: balance, recorded_at: Time.now}

      Display.balance(pin, self)
    end

    def withdraw(amount, account_pin)
      return Display.invalid_pin if pin != account_pin

      return puts 'Insufficient funds!' if (balance + overdraft_limit) < amount

      self.balance -= amount

      transactions << {type: 'debit', amount: amount, balance: balance, recorded_at: Time.now}

      puts "Withdrawn: #{amount} | New balance: #{balance}"
    end
  end
end
