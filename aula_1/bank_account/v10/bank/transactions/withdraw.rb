module Bank
  module Transactions
    class Withdraw
      attr_reader :verification_pin, :account

      def initialize(account:, verification_pin:)
        @verification_pin = verification_pin
        @account = account
      end

      def fulfil(amount:)
        return Display.invalid_pin if pin != verification_pin

        return puts 'Insufficient funds!' if (balance + overdraft_limit) < amount

        account.balance -= amount

        transactions << {type: 'debit', amount: amount, balance: balance, recorded_at: Time.now}

        puts "Withdrawn: #{amount} | New balance: #{balance}"
      end

      private

      def overdraft_limit
        account.overdraft_limit
      end

      def balance
        account.balance
      end

      def transactions
        account.transactions
      end

      def pin
        account.pin
      end
    end
  end
end


