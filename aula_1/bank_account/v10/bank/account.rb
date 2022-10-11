module Bank
  class Account
    attr_accessor :balance, :overdraft_limit, :transactions
    attr_reader :pin

    def initialize(pin:, balance:, overdraft_limit:, transactions: [])
      @pin = pin
      @balance = balance
      @overdraft_limit = overdraft_limit
      @transactions = transactions
    end
  end
end
