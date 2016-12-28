class DataviewController < AppController
  respond_to :html, :js, :json

  def index
    load_collection
  end
  def show
    load_object
  end

  protected
  def load_collection
    params[:q] ||= {}
    @q = object_name.camelize.constantize.order('id desc').ransack(params[:q])
    pages = 20
    @collection = @q.result.page(params[:page]).per(pages)
  end
  def load_object
    @object = object_name.classify.constantize.find_by_id(params[:id])
  end
  def object_name
    controller_name.singularize
  end

end
