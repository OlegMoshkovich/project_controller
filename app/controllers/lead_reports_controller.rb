class LeadReportsController < ApplicationController

  def index
    @daily_report= DailyReport.ensure_today  
    @inspections = @daily_report.inspections.order(created_at: :asc)  
    @walls = @daily_report.inspections.where("element = ?", "WALL").order(created_at: :asc) 
    @slabs = @daily_report.inspections.where("element = ?", "SLAB").order(created_at: :asc) 
    @arches = @daily_report.inspections.where("element = ?", "ARCH").order(created_at: :asc)  
    @user = current_user

		@brian_reports = InspectionReport.where(:inspector => "Brian_S")
		@howard_reports = InspectionReport.where(:inspector => "Howard_Y")
		# @howard_reports = InspectionReport.where(:inspector => "Oleg_Mosh")

		@brian_report_latest = InspectionReport.where(:inspector => "Brian_S").last
		@howard_report_latest = InspectionReport.where(:inspector => "Howard_Y").last
		# @howard_report_latest = InspectionReport.where(:inspector => "Oleg_Mosh").last


		# where(:inspector => current_user.username)
		@users = User.all
		@oleg = @users[2].username
		@inspection_report_current =InspectionReport.where(:inspector => "Oleg_Mosh").last
		# @user = current_user

  end




end
