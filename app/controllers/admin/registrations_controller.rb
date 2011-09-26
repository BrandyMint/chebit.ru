class Admin::RegistrationsController < Admin::ResourcesController
  def export
    @registrations = Registration.all
    attributes = [:full_name, :firm, :website]
    csv_string =  FasterCSV.generate do |csv|
      @registrations.each do |r|
        csv << attributes.map { |a| r.user.send a }
      end
    end

    send_data csv_string,
    :type => 'text/csv; charset=utf-8; header=present',
    :disposition => "attachment; filename=registrations.csv"
  end
end
