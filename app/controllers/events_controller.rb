class EventsController < ApplicationController
  expose(:events){ Event.order("created_at DESC").scoped{} }
  expose(:event, attributes: :event_params)

  def create
    event.time_zone = Time.zone.name
    if event.save
      flash[:notice] = t(:event_was_successfully_created)
      redirect_to calendar_path
    else
      render :new
    end
  end

  def update
    if event.save
      flash[:notice] = t(:event_was_successfully_updated)
      redirect_to calendar_path
    else
      render :edit
    end
  end

  private
  def event_params
    params.require(:event).permit(
      :name,
      :description ,
      :is_all_day ,
      :from_date ,
      :from_time ,
      :to_date ,
      :to_time ,
      :repeats ,
      :repeats_every_n_days ,
      :repeats_every_n_weeks ,
      :repeats_weekly_each_days_of_the_week_mask ,
      :repeats_every_n_months ,
      :repeats_monthly ,
      :repeats_monthly_each_days_of_the_month_mask ,
      :repeats_monthly_on_ordinals_mask ,
      :repeats_monthly_on_days_of_the_week_mask ,
      :repeats_every_n_years ,
      :repeats_yearly_each_months_of_the_year_mask ,
      :repeats_yearly_on ,
      :repeats_yearly_on_ordinals_mask ,
      :repeats_yearly_on_days_of_the_week_mask ,
      :repeat_ends ,
      :repeat_ends_on ,
      :time_zone ,
    )
  end
end

