class StatementsController < AppController
  def index
    redirect_to statement_path(id: DateTime.yesterday.strftime("%Y%m%d"))
  end
  def create
    redirect_to statement_path(id: params[:id])
  end
  def show
    @dt = params[:id]
    @collection = Payment.where(status: 8, order_day: @dt)
    respond_to do |format|
      format.html
      format.csv do
        csv_str = CSV.generate do |csv|
          csv << Payment.column_names
          if @collection
            @collection.each do |pm|
              csv << pm.attributes.values_at(*Payment.column_names)
            end
          end
        end
        send_data csv_str, type: Mime[:csv], disposition: 'inline'
      end
    end
  end
end
