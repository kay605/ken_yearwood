class InputController < ApplicationController


	def openpage
		
		render "input"

	end


	# VARIABLES AND CALCULATIONS

	def output

		# VARIABLES

		@kelloggstartyear = params[:kelloggstartyear].to_i
		@kelloggbudgetyear = params[:kelloggbudgetyear].to_i
		@kelloggtuition = params[:kelloggtuition].to_i
		@kelloggroomboard = params[:kelloggroomboard].to_i
		@kelloggbooks = params[:kelloggbooks].to_i
		@kelloggtravelexpenses = params[:kelloggtravelexpenses].to_i
		@kelloggpersonalexpenses = params[:kelloggpersonalexpenses].to_i
		@kellogghealthinsurance = params[:kellogghealthinsurance].to_i
		@kelloggcomputerequipment = params[:kelloggcomputerequipment].to_i
		@kelloggstudentlifefee = params[:kelloggstudentlifefee].to_i
		@kelloggstudentassociationfee = params[:kelloggstudentassociationfee].to_i
		@kelloggenrollmentfees = params[:kelloggenrollmentfees].to_i
		@kelloggloanfees = params[:kelloggloanfees].to_i
		
		@scholarships = params[:scholarships].to_i
		@personalcontribution = params[:personalcontribution].to_i
		
		@loaninterestrate = params[:loaninterestrate].to_f
		@loanpayoffperiod = params[:loanpayoffperiod].to_i
		
		@pretaxsalary = params[:pretaxsalary].to_i
		@bonusrate = params[:bonusrate].to_f
		
		@carinsurance = params[:carinsurance].to_i
		@carpayment = params[:carpayment].to_i
		@rentmortgage = params[:rentmortgage].to_i
		@utilities = params[:utilities].to_i
		@cableinternet = params[:cableinternet].to_i
		@parking = params[:parking].to_i
		@gas = params[:gas].to_i
		@cellphone = params[:cellphone].to_i
		@food = params[:food].to_i
		@publictransit = params[:publictransit].to_i
		@entertainment = params[:entertainment].to_i
		@generalspending = params[:generalspending].to_i
		
		@retirementsavings = params[:retirementsavings].to_i
		@personalsavingsrate = params[:personalsavingsrate].to_f


		# CALCULATIONS

		# ASSUMES 5% NOMINAL ANNUAL COST INCREASE 
		@tuition_year_1 = @kelloggtuition * ( 1.05 ** (@kelloggstartyear - @kelloggbudgetyear) )
		@tuition_year_2 = @tuition_year_1 * 1.05

		@kellogg_cost_estimate_year_1 = ( @kelloggtuition + @kelloggroomboard + @kelloggbooks + @kelloggtravelexpenses + @kelloggpersonalexpenses + @kellogghealthinsurance + @kelloggcomputer + @kelloggstudentlifefee + @kelloggstudentassociationfee + @kelloggenrollmentfee + @kelloggloanfees ) * ( 1.05 ** (@kelloggstartyear - @kelloggbudgetyear) )
		@kellogg_cost_estimate_year_2 = @kellogg_cost_estimate_year_1 * 1.05

		@annualscholarships = @scholarships / 2
		@annualpersonalcontribution = @personalcontribution / 2

		@maximum_loan_year_1 = @kellogg_cost_estimate_year_1 - ( ( @scholarships + @personalcontribution ) / 2 )
		@maximum_loan_year_2 = @kellogg_cost_estimate_year_2 - ( ( @scholarships + @personalcontribution ) / 2 )
		@total_loan_amount = @kellogg_cost_estimate_year_1 + @kellogg_cost_estimate_year_2
		@monthly_loan_amount = ( (@loaninterestrate / (12 * 100) ) * @loanpayoffperiod ) / ( 1 - (1 + (@loaninterestrate / (12 * 100) ) ** (-12 * @loanpayoffperiod ) ))

		@monthly_pre_tax_salary = @pretaxsalary / 12
		@monthly_post_tax_salary = @monthly_pre_tax_salary * 0.65
		
		@monthly_pre_tax_bonus = @pretaxsalary * (@bonusrate / 100) / 12
		@monthly_post_tax_bonus = @monthly_pre_tax_bonus * 0.50


		@total_monthly_expenses = @monthly_loan_amount + @carinsurance + @carpayment + @rentmortgage + @utilities + @cableinternet + @parking + @gas + @cellphone + @food + @publictransit + @entertainment + @generalspending

		@monthly_savings_subtotal = ( @monthly_post_tax_salary + @monthly_post_tax_bonus ) - @total_monthly_expenses
		@monthly_retirement_savings = @retirementsavings / 12
		@monthly_personal_savings = ( @personalsavingsrate / 100 ) * @monthly_pre_tax_salary

		@total_monthly_savings = @monthly_savings_subtotal - @monthly_retirement_savings - @monthly_personal_savings		
		

	end


end	