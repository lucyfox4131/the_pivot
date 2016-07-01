class LoansController < ApplicationController
  def show
    @loan = Loan.find(params[:id])
    @family = Family.find(params[:id])
  end
end
