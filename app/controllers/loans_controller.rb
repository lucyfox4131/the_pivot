class LoansController < ApplicationController
  def show
    @loan = Loan.find(params[:id])
  end

  def edit
    @loan = Loan.find(params[:id])
  end

  def update
    @loan = Loan.find(param[:id])
    if @loan.update
      flash[:success] = "Your updates have been saved"
      redirect_to admin_families_path
    else
      flash.now[:warning] = @user.errors.full_messages.join(", ")
      render :edit
    end
  end
end
