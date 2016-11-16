class Index::Operation::Create < Operation
  def initialize
    @schema = Index::Schema.new
    @model  = Index.new
  end

  def process(params)
    params = prepare_attributes(params)

    validate(params) do
      model.assign_attributes(params)
      model.save
    end
  end

  private

  def prepare_attributes(params)
    { url: params[:url], tags: Index::Service::ParseHTMLContent.call(params[:url]) }
  end
end
