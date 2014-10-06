class Users::CalendarController < UserController
  expose(:events){ Event.order("created_at DESC").scoped{} }
  def show
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end

