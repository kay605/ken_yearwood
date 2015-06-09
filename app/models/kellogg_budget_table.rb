class KelloggBudgetTable < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  # DEFINE CALCULATED VALUES

  def tuition_year_1
  	return self.kelloggtuition * ( 1.05 ** (self.kelloggstartyear - self.kelloggbudgetyear) )
  end

  def tuition_year_2
  	return tuition_year_1 * 1.05
  end  


  def kellogg_cost_estimate_year_1
  	return ( self.kelloggtuition + self.kelloggroomboard + self.kelloggbooks + self.kelloggtravelexpenses + self.kelloggpersonalexpenses + self.kellogghealthinsurance + self.kelloggcomputer + self.kelloggstudentlifefee + self.kelloggenrollmentfee + self.kelloggloanfees ) * ( 1.05 ** (self.kelloggstartyear - self.kelloggbudgetyear) )
  end

  def kellogg_cost_estimate_year_2
  	return kellogg_cost_estimate_year_1 * 1.05
  end


  def maximum_loan_year_1
  	return kellogg_cost_estimate_year_1 - ( ( self.scholarships + self.personalcontribution ) / 2 )
  end

  def maximum_loan_year_2
  	return kellogg_cost_estimate_year_2 - ( ( self.scholarships + self.personalcontribution ) / 2 )
  end

  def total_loan_amount
  	return kellogg_cost_estimate_year_1 + kellogg_cost_estimate_year_2
  end


  def monthly_loan_amount
  	return ( (self.loaninterestrate / (12 * 100) ) * self.loanpayoffperiod ) / ( 1 - (1 + (self.loaninterestrate / (12 * 100) ) ** (-12 * self.loanpayoffperiod ) ))
  end


  def monthly_post_tax_salary
  	return self.pretaxsalary * 0.65 / 12
  end


  def monthly_post_tax_bonus
  	return self.pretaxsalary * (self.bonusrate / 100) * 0.50 / 12
  end

  def total_monthly_expenses
  	return self.carinsurance + self.carpayment + self.rentmortgage + self.utilities + self.cableinternet + self.parking + self.gas + self.cellphone + self.food + self.publictransit + self.entertainment + self.generalspending
  end


  def monthly_savings
  	return ( monthly_post_tax_salary + monthly_post_tax_bonus ) - total_monthly_expenses
  end



end
