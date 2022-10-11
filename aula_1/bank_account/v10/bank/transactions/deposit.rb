module Bank
  module Transactions
    class Deposit
      attr_reader :account

      def initialize(account:)
        @account = account
      end

      def fulfil(amount:)
        account.balance += amount

        transactions << {type: 'credit', amount: amount, balance: balance, recorded_at: Time.now}

        Display.balance(pin, account)
      end

      private

      def balance
        account.balance
      end

      def pin
        account.pin
      end

      def transactions
        account.transactions
      end
    end
  end
end


