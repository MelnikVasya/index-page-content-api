class Operation
  attr_reader :model, :schema, :errors, :valid

  def call(params)
    res = process(params)
    setup_instance_variables!(res, params)
    self
  end

  def valid?
    valid
  end

  private

  def validate(params)
    yield if schema.call(params).success?
  end

  def setup_instance_variables!(res, params)
    @errors = schema.call(params).messages
    @valid  = res.present?
  end
end
