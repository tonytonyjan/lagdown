class Select2Controller < ApplicationController
  def tags
    @tags = ActsAsTaggableOn::Tag.page(params[:page]).order(:name)
    @tags = @tags.where('name ILIKE ?', "%#{params[:term]}%") if params[:term].present?
    @tags = @tags.includes(:taggings).where('taggings.context' => params[:context]) if params[:context].present?
  end

  def results
    model = params[:model].constantize
    raise Select2Concern::InvalidModel unless model < Select2Concern
    raise Select2Concern::NotInWhiteList unless model.select2_allowed_search? params[:column].to_sym
    @records = model.page(params[:page])
    @records = @records.where("#{params[:column]} ILIKE ?", "%#{params[:term]}%") if params[:term].present?
  end
end
