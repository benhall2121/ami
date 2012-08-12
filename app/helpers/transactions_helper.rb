module TransactionsHelper

  def transaction_amount(transaction_type, startup_id)
    Transaction.sum(:amount, :conditions => ['transaction_type = ? AND startup_id = ?', transaction_type, startup_id]).to_f
  end
  
end
