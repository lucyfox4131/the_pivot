class LoanDecorator < SimpleDelegator
  attr_reader :quantity

  def initialize(loan, quantity)
    @quantity = quantity
    super(loan)
  end
end
