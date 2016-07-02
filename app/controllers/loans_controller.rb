class LoansController < ApplicationController

  def new
    @loan = Loan.new
  end

  def create
    loan = Loan.new(loan_params)
    if loan.save
      flash[:success] = "Loan Created Successfully"
      redirect_to admin_families_path
    else
      flash[:error] = "Loan Creation Failed"
      render :new
    end
  end

  def show
    @loan = Loan.find(params[:id])
  end

  def edit
    @loan = Loan.find(params[:id])
  end

  def update
    @loan = Loan.find(params[:id])
    if @loan.update(loan_params)
      flash[:success] = "Your updates have been saved"
      redirect_to admin_families_path
    else
      flash.now[:warning] = @user.errors.full_messages.join(", ")
      render :edit
    end
  end

  private
  def loan_params
    params.require(:loan).permit(:requested_amount,
                                 :purpose,
                                 :description,
                                 :status)
  end
end
